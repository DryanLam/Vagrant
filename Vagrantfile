# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrant.configure("2") do |config|
#   config.vm.define "control" do |control|
#     control.vm.box = "ubuntu/bionic64"
#     control.vm.network "private_network", ip: "192.168.57.10"
#     control.vm.network "forwarded_port", guest: 80, host: 8080
#     config.vm.network "public_network", bridge: "wlxc83a35c3841d"
#     control.vm.hostname = "control"
#     control.vm.synced_folder ".", "/vagrant"
#     # , :mount_options => ["dmode=777", "fmode=666"]
#     control.vm.provider "virtualbox" do |vb|
#       vb.customize ["modifyvm", :id, "--name", "control"]
#       vb.memory = "1024"
#     end 

#     config.vm.provision "shell", inline: <<-SHELL
#       sudo apt-get update
#       sudo apt-get install -y apache2
#     SHELL
#   end
# end

# Vagrant.configure("2") do |config|

#   config.vm.box = "ubuntu/bionic64"

#   # require plugin https://github.com/leighmcculloch/vagrant-docker-compose
#   config.vagrant.plugins = "vagrant-docker-compose"

#   # install docker and docker-compose
#   config.vm.provision :docker
#   config.vm.provision :docker_compose

#   config.vm.provider "virtualbox" do |vb|
#     vb.customize ["modifyvm", :id, "--ioapic", "on"]
#     vb.customize ["modifyvm", :id, "--memory", "2048"]
#     vb.customize ["modifyvm", :id, "--cpus", "2"]
#   end

# end


# Standard
# Vagrant.configure("2") do |config|
#   config.vm.box = "ubuntu/bionic64"

#   config.vm.provision :docker
#   config.vm.provision :docker_compose
# end


Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.synced_folder ".", "/vagrant"
  config.vm.network "private_network", ip: "192.168.57.10"

  config.vm.provision :docker
  config.vm.provision :docker_compose

  config.vm.provision "shell", inline: <<-SHELL
    cd /vagrant
    pwd
    ls -la
    cd /vagrant/Python_Flask
    chmod 777 -R ./Docker/redis_dump
    sh start.sh
    docker exec -i mongo-db mongorestore --archive --gzip < ./Docker/mongo_dump.gz
    
    docker ps -a 
    sleep 5
    docker exec -i mysql-db /usr/bin/mysql -uroot -pdryan --force tadp < ./Docker/mysql_dump.sql
  SHELL
end








#     config.vm.provision "shell", inline: <<-SHELL
#       sudo apt-get update
#       sudo apt-get install -y apache2
#     SHELL