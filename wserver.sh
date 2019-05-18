#!/bin/bash
#
# Wollok Server start script
#
#

. ./includes/prepareFile.sh

java -cp "$(echo `find jars/ -name "*.jar"` | sed 's# #:#g')"  org.uqbar.project.wollok.server.WollokServer $@ >> $DIR/wollok.log 2>> $DIR/wollok-err.log &
echo $! > $DIR/wollok.pid
