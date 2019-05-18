#!/bin/bash
#
# Wollok interpreter script
#
#

. ./includes/prepareFile.sh

java -cp "$(echo `find jars/ -name "*.jar"` | sed 's# #:#g')" org.uqbar.project.wollok.launch.WollokChecker $@
