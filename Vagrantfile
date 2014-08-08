# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  
  config.vm.network "forwarded_port", guest: 80, host: 8080
  
  config.vm.provision :shell, :path => "bootstrap.sh"
  config.vm.provision :shell, :path => "install-nginx.sh", :args => ""
  #https://rvm.io/integration/vagrant
  config.vm.provision :shell, :path => "install-rvm.sh", :args => "stable"
  config.vm.provision :shell, :path => "install-ruby.sh", :args => "1.9.3"
end
