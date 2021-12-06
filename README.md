# Python/C api in v for modules development and embedding
## Example structure of a Python module written in vlang (WIP)
```v

module hello

import py
import v.util.version

[heap; py_module: 'hello']
struct HelloModuleContext { 
}

[export: 'PyInit_hello'; unsafe]
pub fn py_init_module() &C.PyObject {
	return py.init_module<HelloModuleContext>(&HelloModuleContext{})
}

[py_method; unsafe]
pub fn (mod HelloModuleContext) greetings(self &C.PyObject, ignore &C.PyObject) &C.PyObject { 
	println('This module was build with: ${version.full_v_version(true)}')
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
```

```bash
>>> import hello
>>> hello.boring()
This module was built with: V 0.2.4 105d7fc
>>>
```


## WIP
