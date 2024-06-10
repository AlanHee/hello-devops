#!/bin/bash
# var pacakges array
# for echo mkdir  and pull
server=server_new
if [ -d ~/"$server" ]; then
	cd ~/$server
	git pull
	echo "server pull ok"
else
	git clone git@github.com:AlanHee/server $server
	cd ~/$server
	git pull
	echo "server pull ok"
fi

package_path=packages
if [ -d "$package_path" ]; then
	cd $package_path
else
	mkdir $package_path && cd $package_path
fi

packages=(server_auth server_auth server_memory server_mongo)

#print all elements
#echo ${packages[*]}

for i in "${packages[@]}"; do
	# access each element as $i
	DIRECTORY=$(pwd)/$i
	if [ -d "$DIRECTORY" ]; then
		# code to be executed if $DIRECTORY exists.
		git pull
		echo "package $i pull ok"
	else
		mkdir $i && cd $i
		git clone git@github.com:AlanHee/$i.git
		git pull && cd ..
		echo "make $i and pull ok"
	fi
done
echo "done."
