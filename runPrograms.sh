set -e 

. ./includes/commons.sh

rm ./examples/*

echo "Compilando archivos Wollok..."
interpret "*.wlk"
if [ $? -gt 0 ] ; then
    exit 1
fi
echo "********************************************"
echo "Ejecutando programas..."
interpret "*.wpgm"
if [ $? -gt 0 ] ; then
    exit 1
fi
