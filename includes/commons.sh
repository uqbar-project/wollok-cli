#
# Common functions
#
# Interprets
#    arg 1:  a Wollok file (.wtest, .wlk, .wpgm)
#    arg 2:  passing wollok-cli root folder
#    ...arg: any other args
function interpret() {
    CLI_FOLDER=$2
    for file in `find -name $1 ! -path "*/.history*" ! -path "*/bin/**" ! -path "*/wsanity-check-examples/*" ! -path "*/includes/emptyFile.wlk"`
        do
            echo "   ==>  $file"
            $CLI_FOLDER/winterpreter.sh $file exitOnBuildFailure "${@:3}"
            if [ $? -ne 0 ] ; then
                return 1
            fi
        done
}
