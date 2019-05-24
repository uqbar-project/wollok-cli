#!/bin/bash
#
# Runs all programs in a project
# Author: Dodain
#
set -e 

CLI_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $CLI_DIR/includes/commons.sh

echo "Compilando archivos Wollok..."
interpret "*.wlk"
if [ $? -gt 0 ] ; then
    exit 1
fi
echo "********************************************"
echo "Ejecutando programas..."
interpret "*.wpgm"
if [ $? -gt 0 ] ; then
    exit 1
fi
