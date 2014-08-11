#!/usr/bin/env bash

#Check if Nginx is installed
dpkg -l nginx >/dev/null 2>&1

if [ $? -ne 0 ]; then
	echo ">>>>>Installing Nginx<<<<<"
	apt-get install -y nginx
else
	echo ">>>>>Nginx already installed<<<<<"
fi

if [ -f /etc/nginx/sites-available/default ]; then
	echo ">>>>>Mapping new root path<<<<<"
	#This will change once I actually get jekyll going as I think it is _site
	sed -ri 's|/usr/share/nginx/html|/vagrant/_site|' /etc/nginx/sites-available/default

	echo ">>>>>Restarting Nginx<<<<<"
	service nginx restart
else
	echo ">>>>>File /etc/nginx/sites-available/default does not exist<<<<<"
fi

