SRC=.

set -e 

function interpret() {
    for i in `find $SRC -name $1 -not -path "./.history*"`
        do
            echo "   ==>  $i"
            ./winterpreter.sh $i
            if [ $? -gt 0 ] ; then
                return 1
            fi
        done
}

echo "validando los archivos wollok..."
interpret "*.wlk"
if [ $? -gt 0 ] ; then
    exit 1
fi
echo "...y ahora los tests"
interpret "*.wtest"
if [ $? -gt 0 ] ; then
    exit 1
fi
