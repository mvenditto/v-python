module py

// longobject.h

[typedef]
pub struct C.PyLongObject { }


const (
	py_long_type = &C.PyObject(&C.PyLong_Type)
)

// macro
pub fn C.PyLong_Check(&C.PyObject) int
pub fn C.PyLong_CheckExact(&C.PyObject) int

// PyAPI_FUNC
pub fn C.PyLong_FromLong(int) &C.PyObject
pub fn C.PyLong_FromUnsignedLong(u64) &C.PyObject
pub fn C.PyLong_FromSize_t(&C.size_t) &C.PyObject
pub fn C.PyLong_FromSsize_t(&C.Py_ssize_t) &C.PyObject
pub fn C.PyLong_FromDouble(f64) &C.PyObject
pub fn C.PyLong_AsLong(&C.PyObject) int
pub fn C.PyLong_AsLongAndOverflow(&C.PyObject, int) int
pub fn C.PyLong_AsSsize_t(&C.PyObject) &C.Py_ssize_t
pub fn C.PyLong_AsSize_t(&C.PyObject) &C.size_t
pub fn C.PyLong_AsUnsignedLong(&C.PyObject) u32
pub fn C.PyLong_AsUnsignedLongMask(&C.PyObject) u32
pub fn C.PyLong_GetInfo() &C.PyObject
pub fn C.PyLong_AsDouble(&C.PyObject) f64
pub fn C.PyLong_FromVoidPtr(voidptr) &C.PyObject
pub fn C.PyLong_AsVoidPtr(&C.PyObject) voidptr
pub fn C.PyLong_FromLongLong(i64) &C.PyObject
pub fn C.PyLong_FromUnsignedLongLong(u64) &C.PyObject
pub fn C.PyLong_AsLongLong(&C.PyObject) i64
pub fn C.PyLong_AsUnsignedLongLong(&C.PyObject) u64
pub fn C.PyLong_AsUnsignedLongLongMask(&C.PyObject) u64
pub fn C.PyLong_AsLongLongAndOverflow(&C.PyObject, int)i64
pub fn C.PyLong_FromString(&char, &&char, int) &C.PyObject

// mystrtoul.c
pub fn C.PyOS_strtoul(&char, &&char, &int) u64
pub fn C.PyOS_strtol(&char, &&char, &int) i64
