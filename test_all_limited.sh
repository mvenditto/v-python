export CFLAGS="$(pkg-config python3 --cflags-only-I) -DPy_LIMITED_API=0x30907f0"
export LDFLAGS=$(pkg-config python3-embed --libs)
# export VJOBS=1
v -d py_limited_api -cc gcc test .