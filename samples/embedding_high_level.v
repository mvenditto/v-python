module samples

import py

// unlike building a module, here we need to link against python shared lib
#flag -L/usr/lib/python3.9/config-3.9-x86_64-linux-gnu 
#flag -L/usr/lib/x86_64-linux-gnu
#flag -lcrypt 
#flag -lpython3.9
#flag -ldl 
#flag -lm

fn main() {
	path := c'/vagrant/vlang/test.py'
	program := C.Py_DecodeLocale(path, C.NULL)

	if program == C.NULL {
		panic('Fatal error: cannot decode ${path}')
	}

	C.Py_SetProgramName(program)
	C.Py_Initialize()
	C.PyRun_SimpleString(c"from time import time,ctime;print('Today is', ctime(time()))\n")

	if C.Py_FinalizeEx() < 0 {
		exit(120)
	}

	C.PyMem_RawFree(program)

}