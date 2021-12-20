module py


fn testsuite_begin() {
	C.Py_Initialize()
}

fn testsuite_end() {
}

fn test_py_obj_str() {
	v := 42
	i := C.PyLong_FromLong(v)
	i_str := C.PyObject_Str(i)
	encoded := C.PyUnicode_AsEncodedString(i_str, c'utf-8', c'strict')
	str_c := C.PyBytes_AsString(encoded)
	s := unsafe{cstring_to_vstring(str_c)}
	assert s.trim_space() == v.str()
}


fn test_py_obj_is_instance() {
	i := C.PyLong_FromLong(42)
	assert C.PyObject_IsInstance(i, py_long_type) == 1
}

fn test_py_obj_get_attr_str() {
	version_info := C.PySys_GetObject(c'version_info')
	major_py := C.PyObject_GetAttrString(version_info, c'major')
	assert C.PyLong_Check(major_py) == 1
	assert C.PyLong_AsLong(major_py) == 3
	C.Py_XDECREF(major_py)
}

fn test_py_obj_set_attr_str() {
	os := C.PyImport_ImportModule(c'os')
	a := C.PyLong_FromLong(42)
	C.PyObject_SetAttrString(os, c'test_attr', a)
	b := C.PyObject_GetAttrString(os, c'test_attr')
	assert a.ptr() == b.ptr()
	C.PyObject_SetAttrString(os, c'test_attr', C.NULL)
	assert C.PyObject_GetAttrString(os, c'test_attr').ptr() == C.NULL
}

fn test_py_obj_has_attr_str() {
	a := C.PyLong_FromLong(42)
	assert C.PyObject_HasAttrString(a, c'not_attr_of_a') == 0
}

fn test_py_obj_repr() {
	/*x := C.PyRun_SimpleString(c'x = type("MyClass", (object,), {"__repr__": lambda self: "test"})()')
	assert x.ptr() != C.NULL
	a := C.PyObject_GetAttrString(x, c'my_attr')
	assert C.PyLong_Check(a) == 1
	assert C.PyLong_AsLong(a) == 42
	*/
}

fn test_py_obj_rich_comp() {
	a := C.PyLong_FromLong(0)
	b := C.PyLong_FromLong(1)
	assert C.PyObject_RichCompare(a, b, C.Py_LT).ptr() == py_true.ptr()
	assert C.PyObject_RichCompare(a, b, C.Py_LE).ptr() == py_true.ptr()
	assert C.PyObject_RichCompare(a, b, C.Py_EQ).ptr() == py_false.ptr()
	assert C.PyObject_RichCompare(a, b, C.Py_NE).ptr() == py_true.ptr()
	assert C.PyObject_RichCompare(b, a, C.Py_GT).ptr() == py_true.ptr()
	assert C.PyObject_RichCompare(b, a, C.Py_GE).ptr() == py_true.ptr()
}

fn test_py_obj_rich_comp_bool() {
	a := C.PyLong_FromLong(0)
	b := C.PyLong_FromLong(1)
	assert C.PyObject_RichCompareBool(a, b, C.Py_LT) == 1
	assert C.PyObject_RichCompareBool(a, b, C.Py_LE) == 1
	assert C.PyObject_RichCompareBool(a, b, C.Py_EQ) == 0
	assert C.PyObject_RichCompareBool(a, b, C.Py_NE) == 1
	assert C.PyObject_RichCompareBool(b, a, C.Py_GT) == 1
	assert C.PyObject_RichCompareBool(b, a, C.Py_GE) == 1
}