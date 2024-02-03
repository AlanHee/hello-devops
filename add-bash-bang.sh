#!/bin/bash

# Replace "directory_path" with the path of the directory containing the files you want to modify
DIRECTORY="/data/data/com.termux/files/home/bin/src"

# Replace "line_of_text" with the line of text you want to add to each file
LINE="#!/bin/bash"

# Loop through each file in the directory
for file in $DIRECTORY/*; do
	# Use sed to insert the line of text at the beginning of the file
	# TODO
	#sed -i "$LINE" "$file"
	# Print a message indicating which file was modified
	echo "Added line to $file"
done
