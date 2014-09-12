#!/bin/sh
TAG=$1
TEST_ENV=$2
BROWSER=$3

echo usage: $0 parallel_cucumber features -n 6 -o \"--tags $TAG --t '~@wip' TEST_ENV=$TEST_ENV BROWSER=$BROWSER -p parallel\"
val=$(parallel_cucumber features -n 6 -o \'"--tags" $TAG "--t" '~@wip' "TEST_ENV="$TEST_ENV "BROWSER="$BROWSER -p parallel\')

if [[ $val=~.*failed.* ]]; then
echo "cucumbers Failed, then RERUN!"
cucumber @tmp/cucumber_failures.log TEST_ENV=qa BROWSER=chrome

else
echo "Test Passed!"
fi