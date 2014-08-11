#!/usr/bin/env bash

type rvm >/dev/null 2>&1

if [ $? -ne 0 ]; then
	echo ">>>>>Installing rvm<<<<<"
	\curl -sSL https://get.rvm.io | bash -s $1
	echo ">>>>>Adding rvm path to user's bachrc<<<<<"
	#need to add the source for this session
	source ~/.rvm/scripts/rvm
else
	echo ">>>>>Updating rvm<<<<<"
	rvm get $1
fi

echo ">>>>>rvm version is: $(rvm --version)<<<<<"
