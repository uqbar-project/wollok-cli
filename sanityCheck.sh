#!/bin/bash
#
# Sanity check for Wollok CLI project
# Author: Dodain
#
function testFailingFile() {
    echo "*******************************************************************************"
    echo "Testeando archivo $1"
    if [ ! -s ./examples/$1 ] ; then
        echo "Archivo $1 no existe"
        return 1
    fi
    ./winterpreter.sh ./examples/$1
    if [ $? -ne 1 ] ; then
        echo "$1 no debería haber compilado"
        return 1
    fi
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

echo "*******************************************************************************"
echo "Testing happy path for pepita test and program"
./winterpreter.sh ./examples/pepita.warnings.wlk && ./winterpreter.sh ./examples/pepita.wtest && ./winterpreter.sh ./examples/pepita.wpgm
exit $?
