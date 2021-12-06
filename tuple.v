module py

/* 
tupleobject.h

Another generally useful object type is a tuple of object pointers.
For Python, this is an immutable type.  C code can change the tuple items
(but not their number), and even use tuples as general-purpose arrays of
object references, but in general only brand new tuples should be mutated,
not ones that might already have been exposed to Python code.

*** WARNING *** PyTuple_SetItem does not increment the new item's reference
count, but does decrement the reference count of the item it replaces,
if not nil.  It does *decrement* the reference count if it is *not*
inserted in the tuple.  Similarly, PyTuple_GetItem does not increment the
returned item's reference count.
*/

pub fn C.PyTuple_Check(&C.PyObject) int
pub fn C.PyTuple_CheckExact(&C.PyObject) int
pub fn C.PyTuple_New(&C.Py_ssize_t) &C.PyObject
pub fn C.PyTuple_Size(&C.PyObject) &C.Py_ssize_t
pub fn C.PyTuple_GetItem(&C.PyObject, &C.Py_ssize_t) &C.PyObject
pub fn C.PyTuple_SetItem(&C.PyObject, &C.Py_ssize_t, &C.PyObject) int
pub fn C.PyTuple_GetSlice(&C.PyObject, &C.Py_ssize_t, &C.Py_ssize_t) &C.PyObject
pub fn C.PyTuple_Pack(&C.Py_ssize_t, ...&&C.PyObject) &C.PyObject