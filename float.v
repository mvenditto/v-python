module py

[typedef]
pub struct C.PyFloatObject { }

pub fn C.PyFloat_Check(&C.PyObject) int
pub fn C.PyFloat_CheckExact(&C.PyObject) int

pub fn C.PyFloat_GetMax() f64
pub fn C.PyFloat_GetMin() f64
pub fn C.PyFloat_GetInfo() &C.PyObject
pub fn C.PyFloat_FromDouble(f64) &C.PyObject
pub fn C.PyFloat_AsDouble(&C.PyObject) f64
pub fn C.PyFloat_FromString(&C.PyObject) &C.PyObject