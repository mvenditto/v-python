module py

fn testsuite_begin() {
	C.Py_Initialize()
}

fn testsuite_end() {
}

fn test_tuple_check() {
	t := C.PyTuple_New(3)
	assert C.PyTuple_Check(t) == 1
	assert C.PyTuple_CheckExact(t) == 1
	C.Py_XDECREF(t)
}

fn test_tuple_size() {
	size := 3
	t := C.PyTuple_New(size)
	assert int(C.PyTuple_Size(t)) == size
	C.Py_XDECREF(t)
}

fn test_tuple_get_set() {
	t := C.PyTuple_New(3)
	set_0 := C.PyLong_FromLong(42)
	set_1 := C.PyBool_FromLong(1)
	C.PyTuple_SetItem(t, 0, set_0)
	C.PyTuple_SetItem(t, 1, set_1)
	get_0 := C.PyTuple_GetItem(t, 0)
	get_1 := C.PyTuple_GetItem(t, 1)
	assert_eq(get_0, set_0)
	assert_eq(get_1, set_1)
	C.Py_XDECREF(t)
}

fn test_tuple_slice() {
	t := C.PyTuple_New(3)

	items := [
		C.PyBool_FromLong(0),
		C.PyLong_FromLong(42),
		C.PyBool_FromLong(1)
	]

	for i in 0..3 {
		C.PyTuple_SetItem(t, i, items[i])
	}

	s := C.PyTuple_GetSlice(t, 1, 3)
	assert C.PyTuple_Check(s) == 1 
					
	first := C.PyTuple_GetItem(s, 0)
	assert C.PyLong_Check(first) == 1

	v := C.PyLong_AsLong(first)
	assert v == 42

	C.Py_XDECREF(first)
	C.Py_XDECREF(s)
	C.Py_XDECREF(t)
}