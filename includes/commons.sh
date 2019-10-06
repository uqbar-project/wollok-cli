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
    echo "$files"
    $CLI_FOLDER/winterpreter.sh -severalFiles $files "${@:3}"
}
