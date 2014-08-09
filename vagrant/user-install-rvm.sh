type nvm >/dev/null 2>&1

if [ $? -ne 0 ]; then
	echo ">>>>>Installing rvm<<<<<"
	curl -sSL https://get.rvm.io | bash -s $1
else
	echo ">>>>>rvm already installed<<<<<"
fi
