module py

pub fn C.PyArg_Parse(&C.PyObject, &char, ...&&C.PyObject) int
pub fn C.PyArg_ParseTuple(&C.PyObject, &char, ...&&C.PyObject) int
pub fn C.PyArg_ParseTupleAndKeywords(&C.PyObject, &C.PyObject, &char, &char, ...&&C.PyObject) int
pub fn C.PyArg_VaParse(&C.PyObject, &char, &C.va_list) &int
pub fn C.PyArg_VaParseTupleAndKeywords(&C.PyObject, &C.PyObject, &char, &char, &C.va_list) int
pub fn C.PyArg_ValidateKeywordArguments(&C.PyObject) &int
pub fn C.PyArg_UnpackTuple(&C.PyObject, &char, &C.Py_ssize_t, &C.Py_ssize_t, ...&&C.PyObject) int