#!/bin/bash
if [ -z $1 ]; then
	echo 'e.g: ga "Added xxx fun"'
	exit 0
fi
git gc
git pull
git add .
git commit -m "$1"
git push
