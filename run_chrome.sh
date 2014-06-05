#!/bin/sh
cucumber features --t=@categories TEST_ENV=tst BROWSER=firefox --format html --out features/screenshots/results.html
