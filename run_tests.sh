#!/bin/sh
#run cucumber script with the following arguments (example: sh run_tests.sh @regression stage ff) :
TAG=$1
TEST_ENV=$2
BROWSER=$3
echo usage: $0 cucumber features --t $TAG --t '~@wip' TEST_ENV=$TEST_ENV BROWSER=$BROWSER
cucumber features --t $TAG --t '~@wip' TEST_ENV=$TEST_ENV BROWSER=$BROWSER
