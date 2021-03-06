module py

fn testsuite_begin() {
	C.Py_Initialize()
}

fn testsuite_end() {
}

fn test_bool_check() {
	assert C.PyBool_Check(py_true) == 1
	assert C.PyBool_Check(py_false) == 1
}

fn test_bool_from_long() {
	t := C.PyBool_FromLong(1)
	f := C.PyBool_FromLong(0)
	assert t.ptr() == py_true.ptr()
	assert f.ptr() == py_false.ptr()
}
