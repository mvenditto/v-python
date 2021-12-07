module py

[typedef]
pub struct C.PyDict_Type { }

[typedef]
pub struct C.PyDictKeys_Type

[typedef]
pub struct C.PyDictValues_Type

[typedef]
pub struct C.PyDictItems_Type

pub fn C.PyDict_Check(&C.PyObject) int
pub fn C.PyDict_CheckExact(&C.PyObject) int

pub fn C.PyDict_New() &C.PyObject
pub fn C.PyDict_GetItem(&C.PyObject, &C.PyObject) &C.PyObject
pub fn C.PyDict_GetItemWithError(&C.PyObject, &C.PyObject) &C.PyObject
pub fn C.PyDict_SetItem(&C.PyObject, &C.PyObject, &C.PyObject) int
pub fn C.PyDict_SetDefault(&C.PyObject, &C.PyObject, &C.PyObject) &C.PyObject
pub fn C.PyDict_DelItem(&C.PyObject, &C.PyObject) int
pub fn C.PyDict_Clear(&C.PyObject) &C.void
pub fn C.PyDict_Next(&C.PyObject, &C.Py_ssize_t, &C.PyObject, &C.PyObject) int
pub fn C.PyDict_Keys(&C.PyObject) &C.PyObject
pub fn C.PyDict_Values(&C.PyObject) &C.PyObject
pub fn C.PyDict_Items(&C.PyObject) &C.PyObject
pub fn C.PyDict_Size(&C.PyObject) &C.Py_ssize_t
pub fn C.PyDict_Copy(&C.PyObject) &C.PyObject
pub fn C.PyDict_Contains(&C.PyObject, &C.PyObject) int
pub fn C.PyDict_GetItemString(&C.PyObject, &char) &C.PyObject
pub fn C.PyDict_SetItemString(&C.PyObject, &char, &C.PyObject) int
pub fn C.PyDict_DelItemString(&C.PyObject, &char) int
pub fn C.PyObject_GenericGetDict(&C.PyObject, voidptr) &C.PyObject