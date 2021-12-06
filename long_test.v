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

fn test_long_check() {
	l := C.PyLong_FromLong(4242)
	assert C.PyLong_Check(l) == 1
	assert C.PyLong_CheckExact(l) == 1
	C.Py_XDECREF(l)
}

fn test_long_from_long() {
	val := int(4242)
	py_l := C.PyLong_FromLong(val)
	assert voidptr(py_l) != C.NULL
	v_l := C.PyLong_AsLong(py_l)
	assert v_l == val
	C.Py_XDECREF(py_l)
}

fn test_long_from_ulong() {
	val := u32(4242)
	py_l := C.PyLong_FromUnsignedLong(val)
	assert voidptr(py_l) != C.NULL
	v_l := C.PyLong_AsUnsignedLong(py_l)
	assert v_l == val
	C.Py_XDECREF(py_l)
}

fn test_long_from_long_long() {
	val := i64(4242)
	py_l := C.PyLong_FromLongLong(val)
	assert voidptr(py_l) != C.NULL
	v_l := C.PyLong_AsLongLong(py_l)
	assert v_l == val
	C.Py_XDECREF(py_l)
}

fn test_long_from_u_long_long() {
	val := u64(4242)
	py_l := C.PyLong_FromUnsignedLongLong(val)
	assert voidptr(py_l) != C.NULL
	v_l := C.PyLong_AsUnsignedLongLong(py_l)
	assert v_l == val
	C.Py_XDECREF(py_l)
}

fn test_long_from_float() {
	val := f64(4242)
	py_l := C.PyLong_FromDouble(val)
	assert voidptr(py_l) != C.NULL
	v_l := C.PyLong_AsDouble(py_l)
	assert v_l == val
	C.Py_XDECREF(py_l)
}

fn test_long_from_string() {
	val := 4242
	val_str := val.str()
	py_l := C.PyLong_FromString(val_str.str, C.NULL, 10)
	assert voidptr(py_l) != C.NULL
	v_l := C.PyLong_AsLong(py_l)
	assert v_l == val
	C.Py_XDECREF(py_l)
}

fn test_long_from_voidptr() {
	val := 4242
	py_l := C.PyLong_FromVoidPtr(voidptr(val))
	assert voidptr(py_l) != C.NULL
	v_l := C.PyLong_AsLong(py_l)
	assert v_l == val
	C.Py_XDECREF(py_l)
}
