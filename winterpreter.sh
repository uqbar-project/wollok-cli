#!/bin/bash
#
# Wollok interpreter script
#
#
CLI_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $CLI_DIR/includes/prepareFile.sh

if [ -z "$WOLLOK_DEV_ROOT" ]
then
    CLASSPATH=$(echo `find $CLI_DIR/jars/ -name "*.jar"` | sed 's# #:#g')
else
    WOLLOK_DEPENDENCIES=$(echo `find $CLI_DIR/jars/ -name *.jar  -name "*wollok*" | sed "s#\(.*\)/\(.*\)-[.0-9]\+\.jar#$WOLLOK_DEV_ROOT/\2/target/classes#g"` | sed 's# #:#g') 
    OTHER_DEPENDENCIES=$(echo `find $CLI_DIR/jars/ -name "*.jar" ! -name "*wollok*"` | sed 's# #:#g')
    CLASSPATH="$WOLLOK_DEPENDENCIES:$OTHER_DEPENDENCIES"
fi

java -cp "$CLASSPATH" org.uqbar.project.wollok.launch.WollokLauncher $@