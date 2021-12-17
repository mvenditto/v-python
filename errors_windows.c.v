module py

pub const (
	py_exc_windows_error = &C.PyObject(C.PyExc_WindowsError)
)

pub fn C.PyErr_SetFromWindowsErrWithFilename(int, &char) &C.PyObject
pub fn C.PyErr_SetFromWindowsErr(int) &C.PyObject
pub fn C.PyErr_SetExcFromWindowsErrWithFilenameObject(&C.PyObject, int, &C.PyObject) &C.PyObject
pub fn C.PyErr_SetExcFromWindowsErrWithFilenameObjects(&C.PyObject, int, &C.PyObject, &C.PyObject) &C.PyObject
pub fn C.PyErr_SetExcFromWindowsErrWithFilename(&C.PyObject, int, &char) &C.PyObject
pub fn C.PyErr_SetExcFromWindowsErr(&C.PyObject, int) &C.PyObject