#!/bin/bash

# source _cc_env.sh
# source _cc_env.sh --embed (links libpython)
export CFLAGS=$(python3-config --cflags)
export LDFLAGS=$(python3-config --ldflags $1)

#export CFLAGS=$(pkg-config python-3.9-embed --cflags)
#export LDFLAGS=$(pkg-config python-3.9-embed --libs)

#export CFLAGS=$(pkg-config python3-embed --cflags)
#export LDFLAGS=$(pkg-config python3-embed --libs)

#export CFLAGS=$(pkg-config python3 --cflags)