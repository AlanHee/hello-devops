#!/bin/bash
# Extract command-line options and parameters with getopts
source funs.sh
source men-lib.sh

# if [ "$1" = "" ]; then
# 	showHelp
# 	while read command args; do
# 		doAction $command
# 	done
# elif [ -n $1 ]; then
# 	doAction $1
# fi

# men.sh -a -b value1 -cd test1 test2
while getopts :ab:cdh opt; do
	case "$opt" in
	a) echo "Found the -a option" ;;
	b) echo "Found the -b option with parameter value $OPTARG" ;;
	c) echo "Found the -c option" ;;
	d) echo "Found the -d option" ;;
	h) showHelp ;;
	*) echo "Unknown option: $opt" ;;
	esac
done

shift $(($OPTIND - 1))

echo
count=1
for param in "$@"; do
	echo "Parameter $count: $param"
	count=$(($count + 1))
done
exit
