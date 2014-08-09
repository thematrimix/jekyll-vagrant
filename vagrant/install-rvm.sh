#!/usr/bin/env bash

VAGRANTPATH="/home/vagrant"

dpkg -l ruby >/dev/null 2>&1

if [ $? -eq 0 ]; then
	echo ">>>>>Removing ruby<<<<<"
	apt-get -y remove --purge ruby
fi

#Note the path is relative to the actual box no the Vagrantfile
#ie /vagrant is the shared folder and there is a folder under
#there named vagrant that holds all the provisioning scripts
#This littl command here will run the script as user vagrant instead on root
su -c "source /vagrant/vagrant/user-install-rvm.sh" vagrant

