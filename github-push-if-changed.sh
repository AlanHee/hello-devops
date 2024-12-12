#!/bin/bash

FOLDER_TO_MONITOR=$1
SCRIPT_TO_EXECUTE=$2

# determine weather inotifywait installed
if ! type inotifywait &>/dev/null; then
	apt update -qyy
	apt upgrade -qyy
	apt install -qyy inotify-tools
fi

inotifywait -m -r -e modify,create,delete,move,attrib "$FOLDER_TO_MONITOR" |
	while read directory events filename; do
		echo "Fold $FOLDER_TO_MONITOR changed: $events $filename"
		cd $1
		github-commit-all.sh $(date)
	done
