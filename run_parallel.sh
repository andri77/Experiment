#!/bin/sh
parallel_cucumber features -n 6 -o "--tags @login --t ~@wip TEST_ENV=qa BROWSER=chrome -p parallel"