# encoding: utf-8
# -*- mode: ruby -*-
# vi: set ft=ruby :

MACHINE_NAME = "cbl-mariner"
BOX = "cbl-mariner"

Vagrant.configure("2") do |config|
    config.vm.define MACHINE_NAME do |cblmariner|

        cblmariner.vm.box = BOX
        config.vm.network "private_network", ip: "192.168.56.101", auto_config: false
        config.vm.guest = :linux
        config.disksize.size = '40GB'

        config.vm.provider "virtualbox" do |vb|
          vb.memory = "2024"
          vb.cpus = 4
        end

        config.ssh.username = "vagrant"
        config.ssh.password = "7ghdbwc3mk"
        config.vm.synced_folder ".", "/vagrant", disabled: true
        config.vm.provision "shell", path: "setup.sh"
        end
    end

