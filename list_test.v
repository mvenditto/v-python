module py

fn testsuite_begin() {
	C.Py_Initialize()
}

fn testsuite_end() {
}

fn test_list_check() {
	t := C.PyList_New(3)
	assert C.PyList_Check(t) == 1
	assert C.PyList_CheckExact(t) == 1
	C.Py_XDECREF(t)
}

fn test_list_size() {
	size := 3
	t := C.PyList_New(size)
	assert int(C.PyList_Size(t)) == size
	C.Py_XDECREF(t)
}

fn test_list_get_set() {
	t := C.PyList_New(3)
	set_0 := C.PyLong_FromLong(42)
	set_1 := C.PyBool_FromLong(1)
	C.PyList_SetItem(t, 0, set_0)
	C.PyList_SetItem(t, 1, set_1)
	get_0 := C.PyList_GetItem(t, 0)
	get_1 := C.PyList_GetItem(t, 1)
	assert_eq(get_0, set_0)
	assert_eq(get_1, set_1)
	C.Py_XDECREF(t)
}

fn test_list_slice() {
	t := C.PyList_New(3)

	items := [
		C.PyBool_FromLong(0),
		C.PyLong_FromLong(42),
		C.PyBool_FromLong(1)
	]

	for i in 0..3 {
		C.PyList_SetItem(t, i, items[i])
	}

	s := C.PyList_GetSlice(t, 1, 3)
	assert C.PyList_Check(s) == 1 
					
	first := C.PyList_GetItem(s, 0)
	assert C.PyLong_Check(first) == 1

	v := C.PyLong_AsLong(first)
	assert v == 42

	C.Py_XDECREF(first)
	C.Py_XDECREF(s)
	C.Py_XDECREF(t)
}