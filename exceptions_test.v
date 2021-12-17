module py


fn testsuite_begin() {
	C.Py_Initialize()
}

fn testsuite_end() {
}

fn test_exc_new_text() {
	exc := C.PyErr_NewException(c'mymodule.TestException', C.NULL, C.NULL)
	assert exc.ptr() != C.NULL
	C.Py_XDECREF(exc)
}

fn test_exc_new_with_doc() {
	exc := C.PyErr_NewExceptionWithDoc(c'mymodule.TestException', c'docstring', C.NULL, C.NULL)
	assert exc.ptr() != C.NULL
	C.Py_XDECREF(exc)
}

fn test_exc_set_context() {
	exc := C.PyErr_NewException(c'mymodule.TestException', C.NULL, C.NULL)
	assert exc.ptr() != C.NULL
	defer { C.Py_XDECREF(exc) }
	C.PyException_SetContext(exc, C.PyExc_BufferError)
	ctx := C.PyException_GetContext(exc)
	assert ctx.ptr() == C.PyExc_BufferError
}