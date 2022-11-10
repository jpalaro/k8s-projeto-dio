# -*- mode: ruby -*-
# vi: set ft=ruby  :

Vagrant.configure("2") do |config|
  config.vm.define "docker-vm" do |machine|
    machine.vm.box = "ubuntu/jammy64"
    machine.vm.hostname = "docker-vm"
    machine.vm.network "private_network", ip: "10.10.10.100"
    machine.vm.provider "virtualbox" do |vb|
      vb.name = "docker-vm"
      vb.memory = "1024"
      vb.cpus = "2"
    end
    machine.vm.provision "shell", path: "docker.sh"
  end
end

