#!/usr/bin/env bash

#Check if Nginx is installed
dpkg -l nginx >/dev/null 2>&1

if [ $? -ne 0 ]; then
	echo ">>>>>Installing Nginx<<<<<"
	apt-get install -y nginx
else
	echo ">>>>>Nginx already installed<<<<<"
fi

# $1 is the name of the site which comes from the arguments list

if [ -f /etc/nginx/sites-available/default ] && (( $# )); then
	if [ ! -d /vagrant/$1 ]; then
		echo ">>>>>Mapping new jekyll site<<<<<"
		
		if [ ! -d /vagrant/$1/_site ]; then
			#Create the folder structure
			mkdir -p /vagrant/$1/_site
			
			#Add a gitignore to the _site as _site is required but does not check-in empty folders
			#so this will ignore everything under _site except gitignore itself thus not an empty directory
			printf "*\n\n!.gitignore\n" > /vagrant/$1/_site/.gitignore
		fi
		
		if [ ! -f /etc/nginx/sites-available/$1 ]
			#actually create the config for the site
			cp /etc/nginx/sites-available/default /etc/nginx/sites-available/$1
			#Replace the root mapping of default to our new jekyll site
			#note this is why we must have _site as that is where jekyll puts the built site
			sed -ri 's|/usr/share/nginx/html|/vagrant/$1/_site|' /etc/nginx/sites-available/$1
			#lastly enable the new jekyll site
			ln -s /etc/nginx/sites-available/$1 /etc/nginx/sites-enabled
			
			service nginx restart
		fi
	else
		echo ">>>>>Site already exists<<<<<"
	fi
else
	echo ">>>>>File /etc/nginx/sites-available/default does not exist or invalid argument<<<<<"
fi

