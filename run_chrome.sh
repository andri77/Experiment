#!/bin/sh
cucumber features --t @regression --t ~@wip TEST_ENV=stage BROWSER=chrome