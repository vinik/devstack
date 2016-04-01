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
        v.memory = 4096
        # v.memory = 2048
        v.cpus = 1
    end


    config.vm.provision "chef_solo" do |chef|

        chef.cookbooks_path = ['chef/cookbooks']

        chef.json = {
        }

        # chef.add_recipe 'devstack::user'
        chef.add_recipe 'mydevstack'

    end

    config.vm.provision "shell" do |shell|
        shell.inline = "cd devstack && ./stack.sh"
        shell.privileged = false
        shell.env = {
            "ADMIN_PASSWORD"        => "secret",
            "DATABASE_PASSWORD"     => "secret",
            "RABBIT_PASSWORD"       => "secret",
            "SERVICE_PASSWORD"      => "secret"
        }
    end

    config.vm.provision "shell" do |shell|
        shell.inline = "cd /home/vagrant && wget https://cloud-images.ubuntu.com/trusty/current/trusty-server-cloudimg-amd64-disk1.img"
        shell.privileged = false
    end

    config.vm.provision "shell" do |shell|
        shell.inline = "glance image-create --name='ubuntu trusty image' --container-format=bare --visibility=public --disk-format=qcow2 < trusty-server-cloudimg-amd64-disk1.img"
        shell.privileged = false
        shell.env = {
            "OS_USERNAME"       => "admin",
            "OS_PASSWORD"       => "secret",
            "OS_PROJECT_NAME"   => "demo",
            "OS_TENANT_NAME"    => "default",
            "OS_AUTH_URL"       => "http://127.0.0.1:5000/v2.0/"

        }
    end

end
