#!/bin/bash
#
# Runs all programs in a project
# Author: Dodain
#

# Setting relative folder to this script file
CLI_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $CLI_DIR/includes/commons.sh
source $CLI_DIR/includes/colors.sh

find . -name "*.wpgm" ! -path "*/bin/**" ! -path "*/wsanity-check-examples/*" | egrep '.*' -q
if [ $? -ne 0 ]; then
    echo "$RED$BOLD""ERROR: no se encontraron archivos con extensión *.wpgm.$RESET"
    exit 1
fi

echo "Compilando archivos Wollok..."
interpret "*.wlk" $CLI_DIR
if [ $? -ne 0 ] ; then
    exit 1
fi
echo "==========================================================="
echo "Ejecutando programas..."
interpretSingle "*.wpgm" $CLI_DIR
if [ $? -ne 0 ] ; then
    echo
    echo "$RED$BOLD""ERROR en el programa ejecutado. $RESET$RED""Revise el log para más información.$RESET"
    exit 1
fi
