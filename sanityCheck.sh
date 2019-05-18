./runTests.sh
if [ $? -gt 0 ] ; then
    exit 1
fi
./runPrograms.sh
exit $?
