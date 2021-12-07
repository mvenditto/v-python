module py

fn testsuite_begin() {
	C.Py_Initialize()
}

fn testsuite_end() {
}

fn test_dict_check() {
	d := C.PyDict_New()
	assert C.PyDict_Check(d) == 1
	assert C.PyDict_CheckExact(d) == 1
	C.Py_XDECREF(d)
}

fn test_dict_get_set() {
	d := C.PyDict_New()
	defer {
		C.Py_DECREF(d)
	}
	
	vd := {
		'key1': 1,
		'key2': 2
	}

	for key,val in vd {
		k := C.PyUnicode_FromString(key.str)
		v := C.PyLong_FromLong(val)
		assert k.ptr() != C.NULL
		assert v.ptr() != C.NULL
		defer {
			C.Py_DECREF(k)
			C.Py_DECREF(v)
		}
		err := C.PyDict_SetItem(d, k, v)
		assert err == 0
	}

	for key,val in vd {
		k := C.PyUnicode_FromString(key.str)
		v := C.PyLong_FromLong(val)
		defer {
			C.Py_DECREF(k)
			C.Py_DECREF(v)
		}
		r := C.PyDict_GetItem(d, k)
		assert C.PyLong_Check(r) == 1
		vv := C.PyLong_AsLong(r)
		assert vv == val
	}

	k := C.PyUnicode_FromString(c'not-in-dict')
	should_be_null := C.PyDict_GetItem(d, k)
	assert should_be_null.ptr() == C.NULL
	C.Py_DECREF(k)
}

fn test_dict_get_string() {
	d := C.PyDict_New()

	k := C.PyUnicode_FromString(c'key')
	v := C.PyLong_FromLong(42)

	assert k.ptr() != C.NULL
	assert v.ptr() != C.NULL

	defer {
		C.Py_DECREF(k)
		C.Py_DECREF(v)
	}

	err := C.PyDict_SetItem(d, k, v)
	assert err == 0

	r := C.PyDict_GetItemString(d, c'key')
	assert C.PyLong_Check(r) == 1

	vv := C.PyLong_AsLong(r)
	assert vv == 42

	C.Py_DECREF(d)
}


fn test_dict_set_default() {
	$if !py_limited_api ? {
		d := C.PyDict_New()

		k := C.PyUnicode_FromString(c'key')
		v := C.PyLong_FromLong(42)
		default_obj := C.PyLong_FromLong(24)

		assert k.ptr() != C.NULL
		assert v.ptr() != C.NULL
		assert default_obj.ptr() != C.NULL

		err := C.PyDict_SetItem(d, k, v)
		assert err == 0

		r := C.PyDict_SetDefault(d, k, default_obj)
		
		assert r.ptr() != C.NULL

		C.Py_INCREF(r)
		C.Py_DECREF(default_obj)

		C.PyLong_Check(r)
		

		C.Py_DECREF(d)
		C.Py_DECREF(k)
		C.Py_DECREF(v)
	}
}

fn test_dict_get_with_err() {
	d := C.PyDict_New()
	k := C.PyUnicode_FromString(c'not-in-dict')

	r := C.PyDict_GetItemWithError(d, k)
	assert r.ptr() == C.NULL

	e := C.PyErr_Occurred()
	assert e.ptr() == C.NULL

	C.Py_DECREF(k)
	C.Py_DECREF(d)
}