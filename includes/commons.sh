#
# Common functions
#
# Interprets
#    arg 1: a Wollok file (.wtest, .wlk, .wpgm)
#    arg 2: passing wollok-cli root folder
function interpret() {
    CLI_FOLDER=$2
    for i in `find -name $1 ! -path "*/.history*" ! -path "*/bin/**" ! -path "*/wsanity-check-examples/*" ! -path "*/includes/emptyFile.wlk"`
        do
            echo "   ==>  $i"
            $CLI_FOLDER/winterpreter.sh $i
            if [ $? -gt 0 ] ; then
                return 1
            fi
        done
}
