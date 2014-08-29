#!/usr/bin/env bash

# $1 is the name of the site which comes from the arguments list

type jekyll >/dev/null 2>&1

if [ $? -eq 0 ] && (( $# )); then
	if [ ! -d /vagrant/$1 ]; then
		echo ">>>>>Initializing your new jekyll site<<<<<"
		cd /vagrant
		jekyll new $1
		cd ~
	else
		echo ">>>>>Site already exists skipping<<<<<"
	fi
else
	echo ">>>>>jekyll does not appear to be installed<<<<<"
fi

