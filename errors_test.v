module py


fn testsuite_begin() {
	C.Py_Initialize()
	py_redirect_stderr()
}

fn testsuite_end() {
}

fn py_err_occurred() voidptr {
	r := C.PyErr_Occurred()
	return voidptr(r)
}

fn py_redirect_stderr() {
	io := C.PyImport_ImportModule(c'io')
	str_io := C.PyObject_GetAttrString(io, c'StringIO')
	str_io_i := C.PyObject_CallFunctionObjArgs(str_io, C.NULL)
	C.PySys_SetObject(c'stderr', str_io_i)
	C.Py_XDECREF(io)
	C.Py_XDECREF(str_io)
	C.Py_XDECREF(str_io_i)
}

fn py_read_stderr() string {
	stderr := C.PySys_GetObject(c'stderr') // borrowed ref
	m_getvalue := C.PyUnicode_FromString(c'getvalue')
	m_truncate := C.PyUnicode_FromString(c'truncate')
	m_seek := C.PyUnicode_FromString(c'seek')
	v := C.PyObject_CallMethodObjArgs(stderr, m_getvalue, C.NULL)
	encoded := C.PyUnicode_AsEncodedString(v, c'utf-8', c'strict')
	s := C.PyBytes_AsString(encoded)
	r := unsafe{cstring_to_vstring(s)}
	py_redirect_stderr()
	return r.trim_space()
}

fn test_err_set_string() {
	m := 'test message'
	C.PyErr_SetString(C.PyExc_BaseException, m.str)
	assert py_err_occurred() != C.NULL
	C.PyErr_Print()
	e := py_read_stderr()
	assert 'BaseException: ${m}' == e
	assert py_err_occurred() == C.NULL
}

fn test_err_set_object() {
	m := 'test message'
	msg := C.PyUnicode_FromString(m.str)
	C.PyErr_SetObject(C.PyExc_BaseException, msg)
	assert py_err_occurred() != C.NULL
	C.PyErr_Print()
	e := py_read_stderr()
	assert 'BaseException: ${m}' == e
	C.Py_XDECREF(msg)
	assert py_err_occurred() == C.NULL
}

fn test_err_set_none() {
	C.PyErr_SetNone(C.PyExc_BaseException)
	assert py_err_occurred() != C.NULL
	C.PyErr_Clear()
	assert py_err_occurred() == C.NULL
}

fn test_err_print_ex() {
	m := 'test message'
	msg := C.PyUnicode_FromString(m.str)
	C.PyErr_SetObject(C.PyExc_BaseException, msg)
	assert py_err_occurred() != C.NULL
	C.PyErr_PrintEx(0)
	e := py_read_stderr()
	assert 'BaseException: ${m}' == e
	assert py_err_occurred() == C.NULL
	C.Py_XDECREF(msg)
}

fn test_err_print_ex_with_set_sys_last_vars() {
	message := 'test message'
	msg := C.PyUnicode_FromString(message.str)
	defer {
		C.Py_XDECREF(msg)
	}
	C.PyErr_SetObject(C.PyExc_BaseException, msg)
	assert py_err_occurred() != C.NULL
	C.PyErr_PrintEx(1)

	last_val := C.PySys_GetObject(c'last_value')
	last_val_t := C.PyExceptionInstance_Class(last_val)
	assert last_val_t.ptr() == py_exc_base_exception.ptr()

	last_type := C.PySys_GetObject(c'last_type')
	assert last_type.ptr() == py_exc_base_exception.ptr()

	last_tb := C.PySys_GetObject(c'last_traceback')
	assert last_tb.ptr() != C.NULL

	last_t_name := C.PyObject_GetAttrString(last_val_t, c'__name__')
	encoded := C.PyUnicode_AsEncodedString(last_t_name, c'utf-8', c'strict')
	t_name := C.PyBytes_AsString(encoded)
    exc_name := unsafe{cstring_to_vstring(t_name)}

	e := py_read_stderr()
	assert '$exc_name: $message' == e

	assert py_err_occurred() == C.NULL
}

fn test_err_syntax_location() {
	C.PyErr_SetNone(C.PyExc_SyntaxError)
	C.PyErr_SyntaxLocation(c'test.py', 0)
	assert py_err_occurred() != C.NULL
	C.PyErr_Clear()
	assert py_err_occurred() == C.NULL
}

fn test_err_syntax_location_ex() {
	C.PyErr_SetNone(C.PyExc_SyntaxError)
	C.PyErr_SyntaxLocationEx(c'test.py', 0, 0)
	assert py_err_occurred() != C.NULL
	C.PyErr_Clear()
	assert py_err_occurred() == C.NULL
}

fn test_err_syntax_location_obj() {
	$if !py_limited_api ? {
		C.PyErr_SetNone(C.PyExc_SyntaxError)
		filename := C.PyUnicode_FromString(c'test.py')
		defer { C.Py_DECREF(filename) }
		C.PyErr_SyntaxLocationObject(filename, 0, 0)
		assert py_err_occurred() != C.NULL
		C.PyErr_Clear()
		assert py_err_occurred() == C.NULL
	}
}

fn test_err_ex_matches() {
	C.PyErr_SetNone(C.PyExc_KeyError)
	assert C.PyErr_ExceptionMatches(C.PyExc_KeyError) == 1
	assert py_err_occurred() != C.NULL
	C.PyErr_Clear()
	assert py_err_occurred() == C.NULL
}

fn test_err_given_ex_matches() {
	assert C.PyErr_GivenExceptionMatches(C.PyExc_KeyError, C.PyExc_KeyError) == 1
}

fn test_err_fetch_restore() {
	C.PyErr_SetNone(C.PyExc_KeyError)
	mut exc := py_obj()
	mut val := py_obj()
	mut tb := py_obj()
	C.PyErr_Fetch(&exc, &val, &tb)
	assert py_err_occurred() == C.NULL
	assert exc.ptr() != C.NULL
	assert val.ptr() == C.NULL
	assert tb.ptr() == C.NULL
	assert C.PyErr_GivenExceptionMatches(exc, C.PyExc_KeyError) == 1
	C.PyErr_Restore(exc, val, tb)
	assert py_err_occurred() != C.NULL
	C.PyErr_Clear()
	assert py_err_occurred() == C.NULL
}

fn test_err_normalize_restore() {
	C.PyErr_SetNone(C.PyExc_KeyError)
	mut exc := py_obj()
	mut val := py_obj()
	mut tb := py_obj()
	C.PyErr_Fetch(&exc, &val, &tb)
	C.PyErr_NormalizeException(&exc, &val, &tb)
	assert C.PyErr_GivenExceptionMatches(exc, C.PyExc_KeyError) == 1
	assert C.PyObject_IsInstance(val, exc) == 1
	assert tb.ptr() == C.NULL
	C.PyErr_Restore(exc, val, tb)
	assert py_err_occurred() != C.NULL
	C.PyErr_Clear()
	assert py_err_occurred() == C.NULL
}

fn test_err_get_set_exc_info() {
	C.PyErr_SetNone(C.PyExc_KeyError)
	mut exc := py_obj()
	mut val := py_obj()
	mut tb := py_obj()
	C.PyErr_GetExcInfo(&exc, &val, &tb)
	assert C.PyErr_GivenExceptionMatches(exc, C.Py_None) == 1
	assert val.ptr() == C.NULL
	assert tb.ptr() == C.NULL
	C.PyErr_SetExcInfo(exc, val, tb)
	C.PyErr_Clear()
	assert py_err_occurred() == C.NULL
}