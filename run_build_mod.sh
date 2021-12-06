export PYTHONFAULTHANDLER=1
export PYTHONPATH=$PYTHONPATH:./out
v -cc gcc -keepc -showcc -enable-globals -cg -shared -o ./out/hello.so ./samples/hello.v && python3 test.py