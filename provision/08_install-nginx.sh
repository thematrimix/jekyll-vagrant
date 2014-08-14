#!/usr/bin/env bash

#Check if Nginx is installed
dpkg -l nginx >/dev/null 2>&1

if [ $? -ne 0 ]; then
	echo ">>>>>Installing Nginx<<<<<"
	apt-get install -y nginx
else
	echo ">>>>>Nginx already installed<<<<<"
fi

