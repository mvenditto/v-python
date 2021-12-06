module py

pub fn as_py_obj<T>(value T) &C.PyObject {
	$if T is int {
		return C.PyLong_FromLong(value)
	}
	panic('cannot wrap type ${typeof(value)} as a PyObject.')
}

[inline]
fn assert_eq(a &C.PyObject, b &C.PyObject) {
	assert voidptr(a) == voidptr(b)
}