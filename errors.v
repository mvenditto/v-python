module py

pub fn C.PyErr_SetNone(&C.PyObject) 
pub fn C.PyErr_SetObject(&C.PyObject, &C.PyObject) 
pub fn C.PyErr_SetString(&C.PyObject, &char) 
pub fn C.PyErr_Occurred() &C.PyObject
pub fn C.PyErr_Clear() 
pub fn C.PyErr_Fetch(&&C.PyObject, &&C.PyObject, &&C.PyObject) 
pub fn C.PyErr_Restore(&C.PyObject, &C.PyObject, &C.PyObject) 
pub fn C.PyErr_GetExcInfo(&&C.PyObject, &&C.PyObject, &&C.PyObject) 
pub fn C.PyErr_SetExcInfo(&C.PyObject, &C.PyObject, &C.PyObject) 
pub fn C.PyErr_ExceptionMatches(&C.PyObject) int
pub fn C.PyErr_GivenExceptionMatches(&C.PyObject, &C.PyObject) int
pub fn C.PyErr_NormalizeException(&&C.PyObject, &&C.PyObject, &&C.PyObject) 
pub fn C.PyErr_BadArgument() int
pub fn C.PyErr_NoMemory() &C.PyObject
pub fn C.PyErr_SetFromErrno(&C.PyObject) &C.PyObject
pub fn C.PyErr_SetFromErrnoWithFilenameObject(&C.PyObject, &C.PyObject) &C.PyObject
pub fn C.PyErr_SetFromErrnoWithFilenameObjects(&C.PyObject, &C.PyObject, &C.PyObject) &C.PyObject
pub fn C.PyErr_SetFromErrnoWithFilename(&C.PyObject, &char) &C.PyObject
pub fn C.PyErr_Format(&C.PyObject, &char, ) &C.PyObject
pub fn C.PyErr_FormatV(&C.PyObject, &char, &C.va_list) &C.PyObject
pub fn C.PyErr_SetImportErrorSubclass(&C.PyObject, &C.PyObject, &C.PyObject, &C.PyObject) &C.PyObject
pub fn C.PyErr_SetImportError(&C.PyObject, &C.PyObject, &C.PyObject) &C.PyObject
pub fn C.PyErr_NewExceptionWithDoc(&char, &char, &C.PyObject, &C.PyObject) &C.PyObject
pub fn C.PyErr_WriteUnraisable(&C.PyObject) 
pub fn C.PyErr_SetInterrupt() 
pub fn C.PyErr_SetInterruptEx(int) int
pub fn C.PyErr_SyntaxLocation(&char, int) 
pub fn C.PyErr_SyntaxLocationEx(&char, int, int) 
pub fn C.PyErr_SyntaxLocationObject(&C.PyObject, int, int) 
pub fn C.PyErr_ProgramText(&char, int) &C.PyObject

pub fn C.PyUnicodeDecodeError_GetEncoding(&C.PyObject) &C.PyObject
pub fn C.PyUnicodeDecodeError_GetObject(&C.PyObject) &C.PyObject
pub fn C.PyUnicodeTranslateError_GetObject(&C.PyObject) &C.PyObject
pub fn C.PyUnicodeDecodeError_GetStart(&C.PyObject, &C.Py_ssize_t) int
pub fn C.PyUnicodeTranslateError_GetStart(&C.PyObject, &C.Py_ssize_t) int
pub fn C.PyUnicodeDecodeError_SetStart(&C.PyObject, &C.Py_ssize_t) int
pub fn C.PyUnicodeTranslateError_SetStart(&C.PyObject, &C.Py_ssize_t) int
pub fn C.PyUnicodeDecodeError_GetEnd(&C.PyObject, &C.Py_ssize_t) int
pub fn C.PyUnicodeTranslateError_GetEnd(&C.PyObject, &C.Py_ssize_t) int
pub fn C.PyUnicodeDecodeError_SetEnd(&C.PyObject, &C.Py_ssize_t) int
pub fn C.PyUnicodeTranslateError_SetEnd(&C.PyObject, &C.Py_ssize_t) int
pub fn C.PyUnicodeDecodeError_GetReason(&C.PyObject) &C.PyObject
pub fn C.PyUnicodeTranslateError_GetReason(&C.PyObject) &C.PyObject
pub fn C.PyUnicodeDecodeError_SetReason(&C.PyObject, &char) int
pub fn C.PyUnicodeTranslateError_SetReason(&C.PyObject, &char) int

pub fn C.PyOS_snprintf(&char, &C.size_t, &char, ...&&C.PyObject) int
pub fn C.PyOS_vsnprintf(&char, &C.size_t, &char, &C.va_list) int