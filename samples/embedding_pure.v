module samples

import py
import os

// unlike building a module, here we need to link against python shared lib
#flag -L/usr/lib/python3.9/config-3.9-x86_64-linux-gnu 
#flag -L/usr/lib/x86_64-linux-gnu
#flag -lcrypt 
#flag -lpython3.9
#flag -ldl 
#flag -lm

fn main() {

	if os.args.len < 3 {
		panic('Two argument expected.')
	}

	os.setenv('PYTHONPATH', os.join_path(os.getwd(), 'samples'), true)
	path := c'embedding_pure'

	C.Py_Initialize()
	name := C.PyUnicode_DecodeFSDefault(path)
	mod := C.PyImport_Import(name)
	C.Py_DECREF(name)

	if mod != C.NULL {
		func := C.PyObject_GetAttrString(mod, os.args[1].str)
		if func != C.NULL && C.PyCallable_Check(func) == 1 {
			nargs := os.args.len
			args := C.PyTuple_New(nargs - 2)

			for i in 2..nargs  {
				ai := os.args[i].int()
				value := C.PyLong_FromLong(ai)
				C.PyTuple_SetItem(args, i-2, value) // value reference stolen here
			}

			value := C.PyObject_CallObject(func, args)
			C.Py_DECREF(args)

			if value != C.NULL { 
				long := C.PyLong_AsLong(value)
				println('Result of call: $long')
                C.Py_DECREF(value)
			} else {
                C.Py_DECREF(func)
                C.Py_DECREF(mod)
                C.PyErr_Print()
                panic("Call failed")
			}
		} else {
			C.Py_DECREF(mod)
			C.Py_XDECREF(func)
			panic('Cannot find function: ${os.args[1]}')
		}
	} else {
		C.PyErr_Print()
		panic('Failed to load module: ${path}')
	}

	if C.Py_FinalizeEx() < 0 {
		exit(120)
	}
}