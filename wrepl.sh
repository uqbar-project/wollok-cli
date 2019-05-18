#!/bin/bash
#
# Wollok interpreter script
#
#

. ./includes/prepareFile.sh

#echo java -cp "$(echo $WCLASS_PATH | sed 's# #:#g')" org.uqbar.project.wollok.launch.WollokLauncher $@
java -cp "$(echo `find jars/ -name "*.jar"` | sed 's# #:#g')" org.uqbar.project.wollok.launch.WollokLauncher -r $@
