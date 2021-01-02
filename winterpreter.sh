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

LOG4J_CONFIG=$(find  -name log4j.properties -print -quit)
if [ ! -z  "$LOG4J_CONFIG" ] ; then
  LOG4J_CONFIG="-Dlog4j.configuration='file:${LOG4J_CONFIG}'"
fi
eval java -cp "$CLASSPATH" "$LOG4J_CONFIG" org.uqbar.project.wollok.launch.WollokLauncher $@
