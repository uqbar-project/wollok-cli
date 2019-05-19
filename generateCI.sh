#!/bin/bash
#
# Script for CI generation
# 
# Searches for all necessary jars from selected Wollok installation (first argument) 
# and puts it into jars folder
#
# Author: Dodain
#

if [ -z $1 ]
  then
    echo -e "Usage: generateCI Wollok_dev_root_installation_folder"
    echo -e "Remember you must have Wollok Development environment installed. Follow the instructions in"
    echo -e "https://github.com/uqbar-project/wollok/wiki/Development---Environment-Setup"
    echo -e "and make sure you run 'mvn clean install' first."
    echo -e "Example: if you have a sibling folder wollok-dev and inside you have a wollok directory, call it"
    echo -e "$ ./generateCI.sh ../wollok-dev/wollok"
    echo -e "(without the trailing /)"
    exit 1
fi

JARS_FOLDER=./jars/

mkdir -p $JARS_FOLDER

LAUNCH_FOLDER="$1/org.uqbar.project.wollok.launch"
LIB="./$LAUNCH_FOLDER/lib"
SRC="./$LAUNCH_FOLDER/target"

JARS=(
 "com.google.inject"
 "com.google.guava"
 "javax.inject"
 "org.apache.commons"
 "org.apache.log4j"
 "org.antlr.runtime"
 "org.eclipse.jface"
 "org.eclipse.ui-"
 "org.eclipse.xtext"
 "org.eclipse.equinox"
 "org.eclipse.emf"
 "org.eclipse.core"
 "org.eclipse.debug.core"
 "org.eclipse.debug.ui"
 "org.eclipse.jdt.debug"
 "org.eclipse.jdt.core"
 "org.eclipse.jdt.launching"
 "org.eclipse.osgi"
 "org.eclipse.ui.workbench.texteditor"
 "org.eclipse.ui.ide"
 "org.eclipse.xtend.lib"
 "org.eclipse.xtext.ui"
 "org.eclipse.xtext.ui.shared"
 "org.uqbar.project.xinterpreter"
 "org.uqbar.project.wollok-"
 "org.uqbar.project.wollok.lib"
 "org.uqbar.project.wollok.launch"
)

#WCLASS_PATH="echo $(for i in `find $SRC -name "*.jar"`; do echo $i; done) $(for i in `find $DIR/$LIB -name "*.jar"`; do echo $i; done)"
for i in "${JARS[@]}"
do
  echo "Copying $i*.jar" 
  #find $SRC -name "$i*.jar" | xargs cp -t jars/
  find $SRC -name "$i*.jar" | xargs cp -t $JARS_FOLDER
done

for i in `find $LIB -type f -name "*.jar"`
do
  echo "Copying $i"
  #cp $i jars/
  cp $i $JARS_FOLDER
done
