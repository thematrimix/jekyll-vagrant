#!/usr/bin/env bash

dpkg -l ruby >/dev/null 2>&1

if [ $? -eq 0 ]; then
	echo ">>>>>Removing ruby<<<<<"
	apt-get -y remove --purge ruby
	apt-get -y autoremove
else
	echo ">>>>>ruby is not installed<<<<<"
fi

