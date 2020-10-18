# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "control" do |control|
    control.vm.box = "ubuntu/bionic64"
    control.vm.network "private_network", ip: "192.168.57.10"
    control.vm.network "forwarded_port", guest: 80, host: 8080
    config.vm.network "public_network", bridge: "wlxc83a35c3841d"
    control.vm.hostname = "control"
    control.vm.synced_folder ".", "/vagrant"
    # , :mount_options => ["dmode=777", "fmode=666"]
    control.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--name", "control"]
      vb.memory = "1024"
    end 

    config.vm.provision "shell", inline: <<-SHELL
      sudo apt-get update
      sudo apt-get install -y apache2
    SHELL
  end
end
