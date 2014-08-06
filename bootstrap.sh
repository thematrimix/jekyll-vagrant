#!/bin/bash

VAGRANTPATH="/home/vagrant"

isInstalled() {
	if [ $1 -eq 0 ]; then
		echo "INSTALLED"
	else
		echo "NOT INSTALLED"
	fi
}

apt-get -y update

#Check if Nginx is installed
dpkg -l nginx >/dev/null 2>&1
NGINX_INSTALLED=$?

echo ">>>>>Nginx install status: $(isInstalled $NGINX_INSTALLED)<<<<<"

#if Nginx is not installed via apt-get then install it
if [ $NGINX_INSTALLED -ne 0 ]; then
	echo ">>>>>INSTALLING Nginx<<<<<"
	apt-get install -y nginx
fi
