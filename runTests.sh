#!/bin/bash
#
# Runs all tests in a project
# Author: Dodain
#

# Setting relative folder to this script file
CLI_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $CLI_DIR/includes/commons.sh
source $CLI_DIR/includes/colors.sh

echo "Compilando archivos Wollok..."
interpret "*.wlk" $CLI_DIR
if [ $? -ne 0 ] ; then
    exit 1
fi
echo "==========================================================="
echo "Ejecutando tests..."
interpret "*.wtest" $CLI_DIR -t
if [ $? -ne 0 ] ; then
    echo
    echo "$RED$BOLD""ERROR en los tests. $RESET$RED""Revise el log para más información.$RESET"
    exit 1
fi
