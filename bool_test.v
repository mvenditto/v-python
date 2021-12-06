module py

#flag -L/usr/lib/python3.9/config-3.9-x86_64-linux-gnu 
#flag -L/usr/lib/x86_64-linux-gnu
#flag -lcrypt 
#flag -lpython3.9
#flag -ldl 
#flag -lm

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
	assert_eq(t, py_true)
	assert_eq(f, py_false)
}
