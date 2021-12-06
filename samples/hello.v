
module hello

import py

[heap; py_module: 'hello']
struct HelloModuleContext { 
}

[py_method; unsafe]
pub fn (mod HelloModuleContext) bad_sig(self &C.PyObject) &C.PyObject {
	return py.py_none()
}

[py_method; unsafe]
pub fn (mod HelloModuleContext) boring(self &C.PyObject, ignore &C.PyObject) &C.PyObject { // note the 'ignore' named parameter
	println('I am a boring method from \'${@MOD}\' module!')
	return py.py_none()
}

[py_method: 'greetings'; manualfree]
pub fn (mod HelloModuleContext) example_noargs(self &C.PyObject, ignore &C.PyObject) &C.PyObject { // note the 'ignore' named parameter
	println('greetings from \'${@MOD}\' module!')
	return py.py_none()
}

[py_method: 'echo'; manualfree]
pub fn (mod HelloModuleContext) example_singlearg(self &C.PyObject, text &C.PyObject) &C.PyObject { // note the 'ignore' named parameter
	input := C.PyUnicode_AsUTF8(text)
	echo := unsafe{cstring_to_vstring(input)}
	println('<${@MOD}> says: \'${echo}\'')
	return py.py_none()
}

[py_method: 'hello'; manualfree]
pub fn (mod HelloModuleContext) example_varargs(self &C.PyObject, args &C.PyObject) &C.PyObject {
	a := &C.PyObject(0)
	b := &C.PyObject(0)

	C.PyArg_ParseTuple(args, c'OO', &a, &b)

	e0 := C.PyUnicode_AsUTF8(a)
	s0 := unsafe{cstring_to_vstring(e0)}

	e1 := C.PyUnicode_AsUTF8(b)
	s1 := unsafe{cstring_to_vstring(e1)}

	println('args[0]="${s0}" args[1]="${s1}"')

	return py.py_none()
}

/*
	until it will be possible to either:
		- pass around method pointers
		- use generic anonymous function
	the module struct must explicitly implement the py.Dispatcher interface.
*/
pub fn (mod HelloModuleContext) dispatch(m_name string, self &C.PyObject, args &C.PyObject) &C.PyObject{
	$for method in HelloModuleContext.methods {
		$if method.args[0].typ is C.PyObject 
		 && method.args[1].typ is C.PyObject {
			if method.name == m_name {
				return mod.$method(self, args).str
			}
		}
	}
	return py.py_none()
}

[export: 'PyInit_hello'; unsafe]
pub fn py_init_module() &C.PyObject {
	return py.init_module<HelloModuleContext>(&HelloModuleContext{})
}