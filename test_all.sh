export CFLAGS=$(python3-config --cflags)
export LDFLAGS=$(python3-config --ldflags --embed)
v -cc gcc test .