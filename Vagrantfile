# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
    config.vm.box = "vinik/ubuntu"

    config.vm.network "forwarded_port", guest: 80, host: 8081
    config.vm.network "forwarded_port", guest: 5000, host: 5000
    config.vm.network "forwarded_port", guest: 8776, host: 8776
    config.vm.network "forwarded_port", guest: 8774, host: 8774
    config.vm.network "forwarded_port", guest: 9292, host: 9292

    # config.vm.provision "shell", inline: "sudo apt-get update"

    config.vm.provider "virtualbox" do |v|
        v.name = "devstack"
        v.memory = 2048
        v.cpus = 1
    end


    config.vm.provision "chef_solo" do |chef|

        chef.cookbooks_path = ['chef/cookbooks']

        chef.json = {
        }

        # chef.add_recipe 'devstack::user'
        chef.add_recipe 'mydevstack'

    end

end
