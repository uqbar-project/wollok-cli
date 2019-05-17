SRC=.

set -e 

function interpret() {
    for i in `find $SRC -name $1 -not -path "./.history*"`
        do
            echo $i
            ./winterpreter.sh $i
            if [ $? -gt 0 ] ; then
                exit 1
            fi
        done
}

interpret "*.wlk"
interpret "*.wtest"