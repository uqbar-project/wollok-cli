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
