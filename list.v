
module py

pub fn C.PyList_Check(&C.PyObject) int
pub fn C.PyList_CheckExact(&C.PyObject) int

pub fn C.PyList_New(&C.Py_ssize_t) &C.PyObject
pub fn C.PyList_Size(&C.PyObject) &C.Py_ssize_t
pub fn C.PyList_GetItem(&C.PyObject, &C.Py_ssize_t) &C.PyObject
pub fn C.PyList_SetItem(&C.PyObject, &C.Py_ssize_t, &C.PyObject) int
pub fn C.PyList_Insert(&C.PyObject, &C.Py_ssize_t, &C.PyObject) int
pub fn C.PyList_Append(&C.PyObject, &C.PyObject) int
pub fn C.PyList_GetSlice(&C.PyObject, &C.Py_ssize_t, &C.Py_ssize_t) &C.PyObject
pub fn C.PyList_SetSlice(&C.PyObject, &C.Py_ssize_t, &C.Py_ssize_t, &C.PyObject) int
pub fn C.PyList_Sort(&C.PyObject) int
pub fn C.PyList_Reverse(&C.PyObject) int
pub fn C.PyList_AsTuple(&C.PyObject) &C.PyObject