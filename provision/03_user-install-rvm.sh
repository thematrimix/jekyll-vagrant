#!/usr/bin/env bash

type rvm >/dev/null 2>&1

if [ $? -ne 0 ]; then
	echo ">>>>>Installing rvm<<<<<"
	gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
	\curl -sSL https://get.rvm.io | bash -s $1
	#need to add the source for this session
	source ~/.rvm/scripts/rvm
else
	echo ">>>>>Updating rvm<<<<<"
	rvm get $1
fi

echo ">>>>>rvm version is: $(rvm --version)<<<<<"
