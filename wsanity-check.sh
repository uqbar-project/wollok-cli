#!/bin/bash
#
# Sanity check for Wollok CLI project
# Author: Dodain
#

# Setting relative folder to this script file
CLI_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
SANITY_CHECK_DIR="wsanity-check-examples"

source $CLI_DIR/includes/colors.sh

function testFailingFile() {
    echo "=========================================================================================="
    echo "Testeando archivo $1"
    if [ ! -s $CLI_DIR/$SANITY_CHECK_DIR/$1 ] ; then
        echo "Archivo $1 no existe"
        return 1
    fi
    EXTRA_ARG=""
    if [[ $1 == *.wtest ]] ; then
        EXTRA_ARG="-t"
    fi
    $CLI_DIR/winterpreter.sh $CLI_DIR/$SANITY_CHECK_DIR/$1 exitOnBuildFailure $EXTRA_ARG
    if [ $? -eq 0 ] ; then
        echo "$RED$BOLD""✗ ERROR en $1. $RESET$RED""No debería haber funcionado correctamente.$RESET"
        return 1
    fi

    echo 
    echo "$GREEN$BOLD""$1 √ (OK)$RESET"
    return 0
}

testFailingFile "pepita.notCompiling.wlk" \
    && testFailingFile "pepita.missingImport.wtest" \
    && testFailingFile "pepita.validationError.wlk" \
    && testFailingFile "pepita.assertionError.wtest" \
    && testFailingFile "pepita.runtimeError.wtest" \
    && testFailingFile "pepitaRuntimeError.wtest"
if [ $? -ne 0 ] ; then
    exit 1
fi

echo "=========================================================================================="
echo "Testing happy path for pepita test and program"
$CLI_DIR/winterpreter.sh $CLI_DIR/$SANITY_CHECK_DIR/pepita.warnings.wlk exitOnBuildFailure \
    && $CLI_DIR/winterpreter.sh $CLI_DIR/$SANITY_CHECK_DIR/pepita.wtest -t exitOnBuildFailure \
    && $CLI_DIR/winterpreter.sh $CLI_DIR/$SANITY_CHECK_DIR/pepita.wpgm exitOnBuildFailure
STATUS=$?
echo "$GREEN$BOLD""HAPPY PATH √ (OK)$RESET"
exit $STATUS
