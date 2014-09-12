#!/bin/sh
#run cucumber script with the following arguments (example: sh run_rake.sh stage ff) :
TEST_ENV=$1
BROWSER=$2
echo usage: $0 rake cucumber:regression_with_json_report
rake cucumber:regression_json_report

#pwd
#set TEST_ENV=stage;
#set BROWSER=ff;
#rake -P
#rake cucumber:regression_json_report
#rake cucumber:smoke_with_retry TEST_ENV=qa BROWSER=ff