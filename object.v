module py

pub struct C.PyObject { }

pub fn C.PyObject_Str(&C.PyObject) &C.PyObject
pub fn C.PyObject_CallObject(&C.PyObject, &C.PyObject) &C.PyObject
pub fn C.PyObject_CallFunctionObjArgs(&C.PyObject, ...&C.PyObject) &C.PyObject
pub fn C.PyObject_CallMethodObjArgs(&C.PyObject, &C.PyObject, ...&C.PyObject) &C.PyObject
pub fn C.PyObject_CallMethod(&C.PyObject, &char, &char, ...&C.PyObject) &C.PyObject
pub fn C.PyObject_IsInstance(&C.PyObject, &C.PyObject) int
pub fn C.PyObject_GetAttrString(&C.PyObject, &char) &C.PyObject

[inline]
pub fn (o &C.PyObject) ptr() voidptr {
	return voidptr(o)
}

fn (o &C.PyObject) str() string {
	str_p := C.PyObject_Str(o)
	str_c := C.PyUnicode_AsUTF8(str_p)
    return unsafe{cstring_to_vstring(str_c).trim_space()}
}