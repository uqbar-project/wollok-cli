SRC=.

set -e 

for i in `find $SRC -name "*.wtest" -not -path "./.history*"`
    do
        echo $i
        ./winterpreter.sh $i
        if [ $? -gt 0 ] ; then
            exit 1
        fi
    done
