# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	config.vm.box = "ubuntu/trusty64"

	config.vm.network "forwarded_port", guest: 80, host: 8080

	config.vm.provision :shell, :path => "vagrant/01_bootstrap.sh"
	config.vm.provision :shell, :path => "vagrant/02_install-nginx.sh"
	config.vm.provision :shell, :path => "vagrant/03_pre-install-rvm.sh"
	config.vm.provision :shell, :path => "vagrant/04_user-install-rvm.sh", :args => "stable", :privileged => false
	config.vm.provision :shell, :path => "vagrant/05_user-install-ruby.sh", :args => "2.1 jekyll", :privileged => false
	config.vm.provision :shell, :path => "vagrant/06_pre-install-nvm.sh"
	config.vm.provision :shell, :path => "vagrant/07_user-install-nvm.sh", :args => "v0.13.1", :privileged => false
	config.vm.provision :shell, :path => "vagrant/08_user-install-node.sh",:args => "0.11.13", :privileged => false
	config.vm.provision :shell, :path => "vagrant/cleanup.sh"
end
