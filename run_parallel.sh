#!/bin/sh
parallel_cucumber features -n 6 -o "--tags @regression --t ~@wip TEST_ENV=stage BROWSER=chrome -p parallel"