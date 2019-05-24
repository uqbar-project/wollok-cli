function interpret() {
    echo $CLI_DIR
    echo $2
    echo `find $SRC -name $1 ! -path "./.history*" ! -path "./bin/**" ! -path "$2/examples/*"`
    for i in `find $SRC -name $1 ! -path "./.history*" ! -path "./bin/**" ! -path "$2/examples/*"`
        do
            echo "   ==>  $i"
            $CLI_DIR/winterpreter.sh $i
            if [ $? -gt 0 ] ; then
                return 1
            fi
        done
}
