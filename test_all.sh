export CFLAGS="$(python3-config --cflags) -DPy_LIMITED_API=3"
export LDFLAGS=$(python3-config --ldflags --embed)
v -cc gcc test .