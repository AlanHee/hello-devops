#!/bin/bash

if [ ! -z $USER_NAME ]; then
	git clone git@github.com:$USER_NAME/$1.git
else
	while true; do
		read -p 'github project:' github_project
		if [ -z $github_project ]; then
			echo 'project path can not be empty'
		else
			git clone git@github.com:$github_project.git
			break
		fi
	done
fi
