# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
    config.vm.box = "opscode-ubuntu-14.04"

    config.vm.network "forwarded_port", guest: 8080, host: 8080

    # config.vm.provision "shell", inline: "sudo apt-get update"

    config.vm.provision "chef_solo" do |chef|

        chef.cookbooks_path = ['chef/cookbooks']

        chef.json = {
        }

        # chef.add_recipe 'devstack::user'
        chef.add_recipe 'mydevstack'

    end

end
