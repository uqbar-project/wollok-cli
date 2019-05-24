#!/bin/bash
#
# Wollok interpreter script
#
#

CLI_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $CLI_DIR/includes/prepareFile.sh

#echo java -cp "$(echo $WCLASS_PATH | sed 's# #:#g')" org.uqbar.project.wollok.launch.WollokLauncher $@
java -cp "$(echo `find $CLI_DIR/jars/ -name "*.jar"` | sed 's# #:#g')" org.uqbar.project.wollok.launch.WollokLauncher -r $@
