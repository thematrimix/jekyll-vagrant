#!/usr/bin/env bash

VAGRANTPATH="/home/vagrant"

dpkg -l nodejs >/dev/null 2>&1

if [ $? -eq 0 ]; then
	echo ">>>>>REMOVING NodeJS<<<<<"
	apt-get -y remove --purge nodejs
else
	echo ">>>>>NodeJS is not installed<<<<<"
fi

dpkg -l npm >/dev/null 2>&1

if [ $? -eq 0 ]; then
	echo ">>>>>REMOVING npm<<<<<"
	apt-get -y remove --purge npm
else
	echo ">>>>>npm is not installed<<<<<"
fi

type nvm >/dev/null 2>&1

if [ $? -ne 0 ]; then
	echo ">>>>>Installing nvm<<<<<"
	echo ">>>>>CLONING nvm<<<<<"
	rm -rf $VAGRANTPATH/.nvm
	git clone https://github.com/creationix/nvm.git $VAGRANTPATH/.nvm #updated to match https://github.com/creationix/nvm ReadMe
	printf "\n\n# NVM\nif [ -s $VAGRANTPATH/.nvm/nvm.sh ]; then\n\tNVM_DIR=$VAGRANTPATH/.nvm\n\tsource $VAGRANTPATH/.nvm/nvm.sh\nfi" >> $VAGRANTPATH/.bashrc

	NVM_DIR=$VAGRANTPATH/.nvm
	source $VAGRANTPATH/.nvm/nvm.sh
	
	#need to fix ownership as this script is run under root
	chown -R vagrant:vagrant $VAGRANTPATH/.nvm
else
	echo ">>>>>nvm already installed<<<<<"
fi
