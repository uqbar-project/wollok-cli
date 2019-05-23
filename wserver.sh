#!/bin/bash
#
# Wollok Server start script
#
#

CLI_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $CLI_DIR/includes/prepareFile.sh

java -cp "$(echo `find $CLI_DIR/jars/ -name "*.jar"` | sed 's# #:#g')"  org.uqbar.project.wollok.server.WollokServer $@ >> $DIR/wollok.log 2>> $DIR/wollok-err.log &
echo $! > $DIR/wollok.pid
