#!/bin/bash

source funs.sh

password="123456"
if [ ! -z $DB_PWD ]; then
	password=$DB_PWD
fi

read -p "Type mongodb user's password: (default: $password): " db_pwd
if [ ! -z $db_pwd ]; then
	password="$db_pwd"
fi

saveExport DB_PWD $password
echo "Mangodb  user's password setup"
unset password
