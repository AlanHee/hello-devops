#!/bin/bash

source funs.sh

user="root"
if [ ! -z $DB_USER ]; then
	user=$DB_USER
fi

read -p "Type in mongodb user user: (default: $user)" db_user
if [ ! -z $db_user ]; then
	user="$db_user"
fi

saveExport DB_USER $user
echo "Mongodb user( $user ) setup."
unset user
