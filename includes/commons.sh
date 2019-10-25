#
# Common functions
#
# 
# This should be the next version => once we fix launcher with several files
#    arg 1:     a Wollok folder which contains all test files (.wtest)
#    arg 2:     passing wollok-cli root folder
#    args 3..n: any other interpreter argument
# 
function interpret() {
    STATUS=0
    CLI_FOLDER=$2
    files=`find -name $1 ! -path "*/.history*" ! -path "*/bin/**" ! -path "*/wsanity-check-examples/*" ! -path "*/includes/emptyFile.wlk"`
    echo "Procesando" 
    $CLI_FOLDER/winterpreter.sh -severalFiles $files "${@:3}"
}


# Interprets
#    arg 1:  a Wollok file (.wtest, .wlk, .wpgm)
#    arg 2:  passing wollok-cli root folder
#    ...arg: any other args
function interpretSingle() {
    STATUS=0
    CLI_FOLDER=$2
    for file in `find -name $1 ! -path "*/.history*" ! -path "*/bin/**" ! -path "*/wsanity-check-examples/*" ! -path "*/includes/emptyFile.wlk"`
        do
            $CLI_FOLDER/winterpreter.sh $file exitOnBuildFailure "${@:3}"
            if [ $? -ne 0 ] ; then
                STATUS=1
            fi
        done
    return $STATUS
}
