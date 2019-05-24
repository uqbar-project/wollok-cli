function interpret() {
    echo $CLI_DIR
    echo `find $SRC -name $1 ! -path "./.history*" ! -path "./bin/**" ! -path "$CLI_DIR/examples/*"`
    for i in `find $SRC -name $1 ! -path "./.history*" ! -path "./bin/**" ! -path "$CLI_DIR/examples/*"`
        do
            echo "   ==>  $i"
            $CLI_DIR/winterpreter.sh $i
            if [ $? -gt 0 ] ; then
                return 1
            fi
        done
}
