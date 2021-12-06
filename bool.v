module py

pub const (
	py_true = &C.PyObject(C.Py_True)
	py_false = &C.PyObject(C.Py_False)
)

[inline]
pub fn py_true() &C.PyObject {
	return&C.PyObject(C.Py_True)
}

[inline]
pub fn py_false() &C.PyObject {
	return&C.PyObject(C.Py_False)
}

[inline]
pub fn py_ret_true() &C.PyObject { 
	C.Py_INCREF(C.Py_True)
	return &C.PyObject(C.Py_True)
}

[inline]
pub fn py_ret_false() &C.PyObject { 
	C.Py_INCREF(C.Py_False)
	return &C.PyObject(C.Py_False)
}

pub fn C.PyBool_Check(&C.PyObject) int
pub fn C.PyBool_FromLong(int) &C.PyObject



