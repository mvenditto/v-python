export CFLAGS="$(pkg-config python3 --cflags-only-I)" # -DPy_LIMITED_API=3
export LDFLAGS=$(pkg-config python3-embed --libs)
#export VJOBS=1
v -cc gcc test .