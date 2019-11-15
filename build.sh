#!/bin/bash
#
# Runs all tests in a project
# Author: Dodain
#

# Setting relative folder to this script file

CLI_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $CLI_DIR/includes/commons.sh
source $CLI_DIR/includes/colors.sh

find . -name "*.wlk" | egrep '.*' -q

if [ $? -eq 0 ]; then
    echo "Validando archivos Wollok..."
    echo "==========================================================="
    interpret "*.wlk" $CLI_DIR $@
    if [ $? -ne 0 ] ; then
        exit 1
    fi
else
    echo "$RED$BOLD""ERROR: no se encontraron archivos con extensión *.wlk.$RESET"
    exit 1
fi
