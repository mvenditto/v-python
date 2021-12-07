module py

pub fn as_py_obj<T>(value T) &C.PyObject {
	$if T is int {
		return C.PyLong_FromLong(value)
	}
	panic('cannot wrap type ${typeof(value)} as a PyObject.')
}

[inline]
/* C.PyObject(0) does not compile in test, use this */
fn py_obj() &C.PyObject {
	return &C.PyObject(0)
}