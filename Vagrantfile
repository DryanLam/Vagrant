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


# Vagrant.configure("2") do |config|
#   config.vm.box = "ubuntu/bionic64"
#   config.vm.synced_folder ".", "/vagrant"
#   config.vm.network "private_network", ip: "192.168.57.10"

#   config.vm.provision :docker
#   config.vm.provision :docker_compose

#   config.vm.provision "shell", inline: <<-SHELL
#     cd /vagrant
#     pwd
#     ls -la
#     cd /vagrant/Python_Flask
#     chmod 777 -R ./Docker/redis_dump
#     sh start.sh
#     docker exec -i mongo-db mongorestore --archive --gzip < ./Docker/mongo_dump.gz
    
#     docker ps -a 
#     sleep 5
#     docker exec -i mysql-db /usr/bin/mysql -uroot -pdryan --force tadp < ./Docker/mysql_dump.sql
#   SHELL
# end








#     config.vm.provision "shell", inline: <<-SHELL
#       sudo apt-get update
#       sudo apt-get install -y apache2
#     SHELL

# Monitoring tool

Vagrant.configure("2") do |config|

  config.vm.box = "Dart-Sec/monitoring"
  config.vm.network "public_network"
  config.vm.hostname="devopstools"
  config.vm.provision "shell", inline: <<-SHELL
  # Install Grafana
    sudo apt-get update -y
    sudo apt-get upgrade -y
    sudo apt-get install -y software-properties-common
    sudo sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"
    sudo wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
    sudo apt-get update
    sudo apt-get install grafana -y

  # Install Zabbix
    sudo wget https://repo.zabbix.com/zabbix/4.0/debian/pool/main/z/zabbix-release/zabbix-release_4.0-2+stretch_all.deb
    sudo dpkg -i zabbix-release_4.0-2+stretch_all.deb
    sudo apt update -y

    sudo apt install zabbix-server-mysql -y
    sudo apt install zabbix-frontend-php -y
    sudo apt install zabbix-agent -y
    sudo service zabbix-agent start

    sudo apt install zabbix-java-gateway -y
    sudo service zabbix-java-gateway restart
    sudo service apache2 restart
    sudo systemctl enable zabbix-java-gateway

  # Install InfluxDB and telegraf
    sudo wget https://dl.influxdata.com/influxdb/releases/influxdb_1.7.9_amd64.deb
    sudo dpkg -i influxdb_1.7.9_amd64.deb
    sudo wget https://dl.influxdata.com/telegraf/releases/telegraf_1.12.6-1_amd64.deb
    sudo dpkg -i telegraf_1.12.6-1_amd64.deb
    sudo apt-get update -y

  # Install Tree
    sudo apt-get install tree -y
  SHELL
  config.vm.provider "virtualbox" do |config|
    config.name= "Monitoring-Tools"
  end
end