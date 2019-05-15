#!/bin/bash
#
# Wollok interpreter script
#
#
set -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )


# resolve links - $0 may be a softlink
PRG="$0"

while [ -h "$PRG" ] ; do
  ls=`ls -ld "$PRG"`
  link=`expr "$ls" : '.*-> \(.*\)$'`
  if expr "$link" : '/.*' > /dev/null; then
    PRG="$link"
  else
    PRG=`dirname "$PRG"`/"$link"
  fi
done

DIR=`dirname "$PRG"`

#echo java -cp "$(echo $WCLASS_PATH | sed 's# #:#g')" org.uqbar.project.wollok.launch.WollokLauncher $@
#java -cp "$(echo $WCLASS_PATH | sed 's# #:#g')" org.uqbar.project.wollok.launch.WollokLauncher $@
echo "Running..."
echo `find jars/ -name "*.jar"`
java -cp "$(echo `find jars/ -name "*.jar"` | sed 's# #:#g')" org.uqbar.project.wollok.launch.WollokLauncher $@ > result
if [ -s result ] ; then
  exit 1
fi
