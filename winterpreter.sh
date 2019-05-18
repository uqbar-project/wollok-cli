#!/bin/bash
#
# Wollok interpreter script
#
#
#set -e

. ./includes/prepareFile.sh

java -cp "$(echo `find jars/ -name "*.jar"` | sed 's# #:#g')" org.uqbar.project.wollok.launch.WollokLauncher $@ > result
chmod 666 result
if [ -s result ] ; then 
  grep -q "ERROR\|Exception" result
  if [ $? -eq 0 ]  ; then
    echo "ERROR en el archivo $1. Por favor verifique que funcione correctamente."
    echo
    echo "Resumen de errores"
    cat result
    exit 1
  fi
fi
