# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  
  config.vm.network "forwarded_port", guest: 80, host: 8080
  
  config.vm.provision :shell, :path => "vagrant/bootstrap.sh"
  config.vm.provision :shell, :path => "vagrant/install-nginx.sh"
  config.vm.provision :shell, :path => "vagrant/install-rvm.sh", :args => "stable"
  #config.vm.provision :shell, :path => "vagrant/install-ruby.sh", :args => "2.1 jekyll"
  #config.vm.provision :shell, :path => "vagrant/install-nvm.sh"
  #config.vm.provision :shell, :path => "vagrant/cleanup.sh"
end
