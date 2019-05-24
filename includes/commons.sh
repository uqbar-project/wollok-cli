function interpret() {
    CLI_FOLDER=$2
    echo `find -name $1 ! -path "*/.history*" ! -path "*/bin/**" ! -path "$CLI_FOLDER/examples/*"`
    for i in `find -name $1 ! -path "*/.history*" ! -path "*/bin/**" ! -path "$CLI_FOLDER/examples/*"`
        do
            echo "   ==>  $i"
            $CLI_FOLDER/winterpreter.sh $i
            if [ $? -gt 0 ] ; then
                return 1
            fi
        done
}
