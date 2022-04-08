# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "cbl-mariner"
  config.vm.guest = :linux
  config.disksize.size = '40GB'

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2024"
    vb.cpus = 4
  end

  config.ssh.username = 'vagrant'
  config.ssh.password = 'vagrant'
  config.ssh.insert_key = 'true'

  config.vm.box_check_update = false
  
  config.vm.network "private_network", ip: "192.168.56.101", auto_config: false

  # config.vm.synced_folder "../data", "/vagrant_data"
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.

  # config.vm.provision "shell", path: "setup.sh"
  # config.vm.provision "shell", inline: <<-SHELL
  #   echo "Hello world"
  # SHELL

  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.provision "shell", path: "setup.sh"
end
