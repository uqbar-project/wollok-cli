#
# Common functions
#
# Interprets
#    arg 1:  a Wollok file (.wtest, .wlk, .wpgm)
#    arg 2:  passing wollok-cli root folder
#    ...arg: any other args
function interpret() {
    STATUS=0
    CLI_FOLDER=$2
    files=`find -name $1 ! -path "*/.history*" ! -path "*/bin/**" ! -path "*/wsanity-check-examples/*" ! -path "*/includes/emptyFile.wlk"`
    # echo $CLI_FOLDER/winterpreter.sh -dontValidate -severalFiles $files exitOnBuildFailure "${@:3}"
    $CLI_FOLDER/winterpreter.sh -severalFiles $files "${@:3}"
}
