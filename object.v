module py

pub struct C.PyObject { }

const (
	py_not_implemented = &C.PyObject(C.Py_NotImplemented)
)

// Py_LT, Py_LE, Py_EQ, Py_NE, Py_GT, or Py_GE
pub enum PyRichCompareOp {
	lt = C.Py_LT
	le = C.Py_LE
	eq = C.Py_EQ
	ne = C.Py_NE
	gt = C.Py_GT
	ge = C.Py_GE 
}

// object protocol
pub fn C.PyObject_Str(&C.PyObject) &C.PyObject
pub fn C.PyObject_Repr(&C.PyObject) &C.PyObject
pub fn C.PyObject_IsInstance(&C.PyObject, &C.PyObject) int
pub fn C.PyObject_GetAttrString(&C.PyObject, &char) &C.PyObject
pub fn C.PyObject_ASCII(&C.PyObject) &C.PyObject
pub fn C.PyObject_Bytes(&C.PyObject) &C.PyObject
pub fn C.PyObject_RichCompare(&C.PyObject, &C.PyObject, int) &C.PyObject
pub fn C.PyObject_RichCompareBool(&C.PyObject, &C.PyObject, int) int
pub fn C.PyObject_SetAttrString(&C.PyObject, &char, &C.PyObject) int
pub fn C.PyObject_HasAttrString(&C.PyObject, &char) int
pub fn C.PyObject_GetAttr(&C.PyObject, &C.PyObject) &C.PyObject
pub fn C.PyObject_SetAttr(&C.PyObject, &C.PyObject, &C.PyObject) int
pub fn C.PyObject_HasAttr(&C.PyObject, &C.PyObject) int
pub fn C.PyObject_SelfIter(&C.PyObject) &C.PyObject
pub fn C.PyObject_GenericGetAttr(&C.PyObject, &C.PyObject) &C.PyObject
pub fn C.PyObject_GenericSetAttr(&C.PyObject, &C.PyObject, &C.PyObject) int
pub fn C.PyObject_GenericSetDict(&C.PyObject, &C.PyObject, voidptr) int
pub fn C.PyObject_Hash(&C.PyObject) &C.Py_hash_t
pub fn C.PyObject_HashNotImplemented(&C.PyObject) &C.Py_hash_t
pub fn C.PyObject_IsTrue(&C.PyObject) int
pub fn C.PyObject_Not(&C.PyObject) int

// call protcol
pub fn C.PyObject_CallObject(&C.PyObject, &C.PyObject) &C.PyObject
pub fn C.PyObject_CallFunctionObjArgs(&C.PyObject, ...&C.PyObject) &C.PyObject
pub fn C.PyObject_CallMethodObjArgs(&C.PyObject, &C.PyObject, ...&C.PyObject) &C.PyObject
pub fn C.PyObject_CallMethod(&C.PyObject, &char, &char, ...&C.PyObject) &C.PyObject
pub fn C.PyObject_CallMethodNoArgs(&C.PyObject, &C.PyObject) &C.PyObject

[inline]
pub fn py_not_implemented_ret() &C.PyObject { 
	C.Py_INCREF(C.Py_NotImplemented)
	return &C.PyObject(C.Py_NotImplemented)
}

[inline]
pub fn (o &C.PyObject) ptr() voidptr {
	return voidptr(o)
}

fn (o &C.PyObject) str() string {
	str_p := C.PyObject_Str(o)
	$if py_limited_api {
		encoded := C.PyUnicode_AsEncodedString(str_p, c'utf-8', c'strict')
		str_c := C.PyBytes_AsString(encoded)
		return unsafe{cstring_to_vstring(str_c).trim_space()}
	} $else {
		str_c := C.PyUnicode_AsUTF8(str_p)
    	return unsafe{cstring_to_vstring(str_c).trim_space()}
	}
}

fn (o &C.PyObject) repr() string {
	str_p := C.PyObject_Repr(o)
	$if py_limited_api {
		encoded := C.PyUnicode_AsEncodedString(str_p, c'utf-8', c'strict')
		str_c := C.PyBytes_AsString(encoded)
		return unsafe{cstring_to_vstring(str_c).trim_space()}
	} $else {
		str_c := C.PyUnicode_AsUTF8(str_p)
    	return unsafe{cstring_to_vstring(str_c).trim_space()}
	}
}