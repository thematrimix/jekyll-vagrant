#!/usr/bin/env bash

# $1 is the name of the site which comes from the arguments list

#Now that we have the site setup with nginx lets have jekyll create us a starter
type jekyll >/dev/null 2>&1

if [ $? -ne 0 ] && (( $# )); then
	if [ ! -d /vagrant/$1 ]; then
		echo ">>>>>Initializing your new jekyll site<<<<<"
		jekyll new /vagrant/$1
		#now for the tricky thing
		#jekyll by default adds a gitignore at the top level specificity to ignore the _site directory
		#so delete it as we need to keep _site around even if we check it in say to github
		rm -f /vagrant/$1/.gitignore
	else
		echo ">>>>>Site already exists skipping<<<<<"
	fi
	
	#jekyll build --watch
else
	echo ">>>>>jekyll does not appear to be installed<<<<<"
fi

