module py

fn testsuite_begin() {
	C.Py_Initialize()
}

fn testsuite_end() {
}

fn test_arg_parse_tuple() {
	args := C.PyTuple_New(3)

	items := [
		C.PyBool_FromLong(0),
		C.PyLong_FromLong(42),
		C.PyBool_FromLong(1)
	]

	for i in 0..3 {
		C.PyTuple_SetItem(args, i, items[i])
	}

	mut x := py_obj() // C.PyObject(0)
	mut y := py_obj()
	mut z := py_obj()

	assert C.PyTuple_Check(args) == 1

	assert C.PyArg_ParseTuple(args, c'OOO', &x, &y, &z) == 1

	assert C.PyBool_Check(x) == 1
	assert C.PyLong_Check(y) == 1
	assert C.PyBool_Check(z) == 1

	assert_eq(x, py_false)
	assert C.PyLong_AsLong(y) == 42
	assert_eq(z, py_true)

	C.Py_XDECREF(args) 
}