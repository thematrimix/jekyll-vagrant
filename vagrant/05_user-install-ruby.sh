#!/usr/bin/env bash

if [ -s ~/.rvm/scripts/rvm ]; then
	source ~/.rvm/scripts/rvm
	
	echo ">>>>>Installing ruby version $1<<<<<"
	rvm install $1

	#For now just use the last installed
	rvm use --default $1

	shift
	
	if (( $# )); then
		echo ">>>>>Installing gems $@<<<<<"
		gem install $@
	fi
else
	echo ">>>>>rvm does not appear to be installed<<<<<"
fi

echo ">>>>>ruby version is: $(ruby -v)<<<<<"

