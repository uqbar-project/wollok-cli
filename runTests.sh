SRC=.

for i in `find $SRC -name "*.wtest"`
    do
        echo $i
        if ./winterpreter.sh $i ; then
            exit 1
        fi
    done
