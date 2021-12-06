export PYTHONFAULTHANDLER=1
sample=$1
shift
v -cc gcc -keepc -showcc -enable-globals -cg ./samples/$sample.v -o ./out
./samples/$sample "$@"