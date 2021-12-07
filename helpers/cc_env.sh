#!/bin/bash

# source _cc_env.sh
# source _cc_env.sh --embed (links libpython)
export CFLAGS=$(python3-config --cflags)
export LDFLAGS=$(python3-config --ldflags $1)