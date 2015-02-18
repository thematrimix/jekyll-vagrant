# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	config.vm.box = "ubuntu/trusty64"

	config.vm.network "forwarded_port", guest: 4000, host: 4000

	config.vm.provision :shell, :path => "provision/01_bootstrap.sh"
	config.vm.provision :shell, :path => "provision/02_pre-install-rvm.sh"
	config.vm.provision :shell, :path => "provision/03_user-install-rvm.sh", :args => "stable", :privileged => false
	config.vm.provision :shell, :path => "provision/04_user-install-ruby.sh", :args => "2.2 jekyll", :privileged => false
	config.vm.provision :shell, :path => "provision/05_pre-install-nvm.sh"
	config.vm.provision :shell, :path => "provision/06_user-install-nvm.sh", :args => "v0.23.3", :privileged => false
	config.vm.provision :shell, :path => "provision/07_user-install-node.sh", :args => "stable", :privileged => false
	config.vm.provision :shell, :path => "provision/08_user_create_jekyll_site.sh", :args => "[[site_name]]", :privileged => false
	config.vm.provision :shell, :path => "provision/99_cleanup.sh"
end
