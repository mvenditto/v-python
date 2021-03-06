module py

pub const (
	py_exc_base_exception = &C.PyObject(C.PyExc_BaseException)
	py_exc_exception = &C.PyObject(C.PyExc_Exception)
	// py_exc_base_exception_group = &C.PyObject(C.PyExc_BaseExceptionGroup)
	py_exc_stop_async_iteration = &C.PyObject(C.PyExc_StopAsyncIteration)
	py_exc_stop_iteration = &C.PyObject(C.PyExc_StopIteration)
	py_exc_generator_exit = &C.PyObject(C.PyExc_GeneratorExit)
	py_exc_arithmetic_error = &C.PyObject(C.PyExc_ArithmeticError)
	py_exc_lookup_error = &C.PyObject(C.PyExc_LookupError)
	py_exc_assertion_error = &C.PyObject(C.PyExc_AssertionError)
	py_exc_attribute_error = &C.PyObject(C.PyExc_AttributeError)
	py_exc_buffer_error = &C.PyObject(C.PyExc_BufferError)
	py_exc_eof_error = &C.PyObject(C.PyExc_EOFError)
	py_exc_floating_point_error = &C.PyObject(C.PyExc_FloatingPointError)
	py_exc_os_error = &C.PyObject(C.PyExc_OSError)
	py_exc_import_error = &C.PyObject(C.PyExc_ImportError)
	py_exc_module_not_found_error = &C.PyObject(C.PyExc_ModuleNotFoundError)
	py_exc_index_error = &C.PyObject(C.PyExc_IndexError)
	py_exc_key_error = &C.PyObject(C.PyExc_KeyError)
	py_exc_keyboard_interrupt = &C.PyObject(C.PyExc_KeyboardInterrupt)
	py_exc_memory_error = &C.PyObject(C.PyExc_MemoryError)
	py_exc_name_error = &C.PyObject(C.PyExc_NameError)
	py_exc_overflow_error = &C.PyObject(C.PyExc_OverflowError)
	py_exc_runtime_error = &C.PyObject(C.PyExc_RuntimeError)
	py_exc_recursion_error = &C.PyObject(C.PyExc_RecursionError)
	py_exc_not_implemented_error = &C.PyObject(C.PyExc_NotImplementedError)
	py_exc_syntax_error = &C.PyObject(C.PyExc_SyntaxError)
	py_exc_indentation_error = &C.PyObject(C.PyExc_IndentationError)
	py_exc_tab_error = &C.PyObject(C.PyExc_TabError)
	py_exc_reference_error = &C.PyObject(C.PyExc_ReferenceError)
	py_exc_system_error = &C.PyObject(C.PyExc_SystemError)
	py_exc_system_exit = &C.PyObject(C.PyExc_SystemExit)
	py_exc_type_error = &C.PyObject(C.PyExc_TypeError)
	py_exc_unbound_local_error = &C.PyObject(C.PyExc_UnboundLocalError)
	py_exc_unicode_error = &C.PyObject(C.PyExc_UnicodeError)
	py_exc_unicode_encode_error = &C.PyObject(C.PyExc_UnicodeEncodeError)
	py_exc_unicode_decode_error = &C.PyObject(C.PyExc_UnicodeDecodeError)
	py_exc_unicode_translate_error = &C.PyObject(C.PyExc_UnicodeTranslateError)
	py_exc_value_error = &C.PyObject(C.PyExc_ValueError)
	py_exc_zero_division_error = &C.PyObject(C.PyExc_ZeroDivisionError)
	py_exc_blocking_io_error = &C.PyObject(C.PyExc_BlockingIOError)
	py_exc_broken_pipe_error = &C.PyObject(C.PyExc_BrokenPipeError)
	py_exc_child_process_error = &C.PyObject(C.PyExc_ChildProcessError)
	py_exc_connection_error = &C.PyObject(C.PyExc_ConnectionError)
	py_exc_connection_aborted_error = &C.PyObject(C.PyExc_ConnectionAbortedError)
	py_exc_connection_refused_error = &C.PyObject(C.PyExc_ConnectionRefusedError)
	py_exc_connection_reset_error = &C.PyObject(C.PyExc_ConnectionResetError)
	py_exc_file_exists_error = &C.PyObject(C.PyExc_FileExistsError)
	py_exc_file_not_found_error = &C.PyObject(C.PyExc_FileNotFoundError)
	py_exc_interrupted_error = &C.PyObject(C.PyExc_InterruptedError)
	py_exc_is_a_directory_error = &C.PyObject(C.PyExc_IsADirectoryError)
	py_exc_not_a_directory_error = &C.PyObject(C.PyExc_NotADirectoryError)
	py_exc_permission_error = &C.PyObject(C.PyExc_PermissionError)
	py_exc_process_lookup_error = &C.PyObject(C.PyExc_ProcessLookupError)
	py_exc_timeout_error = &C.PyObject(C.PyExc_TimeoutError)
	py_exc_io_error = &C.PyObject(C.PyExc_IOError)
	py_exc_user_warning = &C.PyObject(C.PyExc_UserWarning)
	py_exc_deprecation_warning = &C.PyObject(C.PyExc_DeprecationWarning)
	py_exc_pending_deprecation_warning = &C.PyObject(C.PyExc_PendingDeprecationWarning)
	py_exc_syntax_warning = &C.PyObject(C.PyExc_SyntaxWarning)
	py_exc_runtime_warning = &C.PyObject(C.PyExc_RuntimeWarning)
	py_exc_future_warning = &C.PyObject(C.PyExc_FutureWarning)
	py_exc_import_warning = &C.PyObject(C.PyExc_ImportWarning)
	py_exc_unicode_warning = &C.PyObject(C.PyExc_UnicodeWarning)
	py_exc_bytes_warning = &C.PyObject(C.PyExc_BytesWarning)
	// py_exc_encoding_warning = &C.PyObject(C.PyExc_EncodingWarning)
	py_exc_resource_warning = &C.PyObject(C.PyExc_ResourceWarning)
)

pub fn C.PyExceptionClass_Check(&C.PyObject) int
pub fn C.PyExceptionInstance_Check(&C.PyObject) int
pub fn C.PyExceptionInstance_Class(&C.PyObject) &C.PyObject

pub fn C.PyException_GetTraceback(&C.PyObject) &C.PyObject
pub fn C.PyException_GetCause(&C.PyObject) &C.PyObject
pub fn C.PyException_GetContext(&C.PyObject) &C.PyObject
pub fn C.PyException_SetTraceback(&C.PyObject, &C.PyObject) int
pub fn C.PyException_SetCause(&C.PyObject, &C.PyObject) 
pub fn C.PyException_SetContext(&C.PyObject, &C.PyObject) 

pub fn C.PyExceptionClass_Name(&C.PyObject) &char
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