module py


fn testsuite_begin() {
	C.Py_Initialize()
}

fn testsuite_end() {
}