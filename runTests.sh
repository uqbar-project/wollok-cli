#!/bin/bash
#
# Runs all tests in a project
# Author: Dodain
#

set -e 

# Setting relative folder to this script file
CLI_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $CLI_DIR/includes/commons.sh

echo "Compilando archivos Wollok..."
interpret "*.wlk"
if [ $? -gt 0 ] ; then
    exit 1
fi
echo "==========================================================="
echo "Ejecutando tests..."
interpret "*.wtest"
if [ $? -gt 0 ] ; then
    exit 1
fi
