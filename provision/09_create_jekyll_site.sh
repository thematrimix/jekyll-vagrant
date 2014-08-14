#!/usr/bin/env bash

# $1 is the name of the site which comes from the arguments list

if [ -f /etc/nginx/sites-available/default ] && [ $# ]; then
	if [ ! -d /vagrant/$1 ]; then
		echo ">>>>>Creating new jekyll site<<<<<"
		#Create the folder structure
		mkdir -p /vagrant/$1/_site
		#Add a gitignore to the _site as _site is required but does not check-in empty folders
		#so this will ignore everything under _site except gitignore itself thus not an empty directory
		printf "*\n\n!.gitignore\n" > /vagrant/$1/_site/.gitignore
		cp /etc/nginx/sites-available/default /etc/nginx/sites-available/$1
		#Replace the root mapping of default to our new jekyll site
		#note this is why we must have _site as that is where jekyll puts the built site
		sed -ri 's|/usr/share/nginx/html|/vagrant/$1/_site|' /etc/nginx/sites-available/$1
		#lastly enable the new jekyll site
		ln -s /etc/nginx/sites-available/$1 /etc/nginx/sites-enabled
		
		service nginx restart
	else
		echo ">>>>>Site already exists<<<<<"
	fi
else
	echo ">>>>>File /etc/nginx/sites-available/default does not exist or invalid argument<<<<<"
fi

#Now that we have the site setup with nginx lets have jekyll create us a starter
type jekyll >/dev/null 2>&1

if [ $? -ne 0 ]; then
	echo ">>>>>Initializing your new jekyll site<<<<<"
	jekyll new /vagrant/$1
	#now for the tricky thing
	#jekyll by default adds a gitignore at the top level specificity to ignore the _site directory
	#so delete it as we need to keep _site around even if we check it in say to github
	rm -f /vagrant/$1/.gitignore
	
	#all of this was done under root because editing nginx requires it
	#so we need to fix ownership
	chown -R vagrant:vagrant /vagrant
	
	#jekyll build --watch
else
	echo ">>>>>jekyll does not appear to be installed<<<<<"
fi

