# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
    config.vm.box = "vinik/ubuntu"

    # config.vm.network "private_network", ip: "10.40.7.163"
    config.vm.network "public_network", ip: "10.40.7.163"

    config.vm.network "forwarded_port", guest: 80, host: 8081
    config.vm.network "forwarded_port", guest: 5000, host: 5000
    config.vm.network "forwarded_port", guest: 8776, host: 8776
    config.vm.network "forwarded_port", guest: 8774, host: 8774
    config.vm.network "forwarded_port", guest: 9292, host: 9292

    # config.vm.provision "shell", inline: "sudo apt-get update"

    config.vm.provider "virtualbox" do |v|
        v.name = "devstack"
        v.memory = 16384
        # v.memory = 2048
        v.cpus = 1
    end

    # Download devstack
    config.vm.provision "chef_solo" do |chef|
        chef.cookbooks_path = ['chef/cookbooks']
        chef.add_recipe 'mydevstack'
    end

    # Install devstack
    config.vm.provision "shell" do |shell|
        shell.inline = "cd devstack && ./stack.sh"
        shell.privileged = false
        shell.env = {
            "ADMIN_PASSWORD"        => "secret",
            "DATABASE_PASSWORD"     => "secret",
            "RABBIT_PASSWORD"       => "secret",
            "SERVICE_PASSWORD"      => "secret",
            # "FLOATING_RANGE"        => "10.0.0.1/24",
            # "FIXED_RANGE"           => "10.40.199.0/24",
            "FLOATING_RANGE"        => "10.40.199.0/24",
            "FIXED_RANGE"           => "10.0.0.1/24",
            "FIXED_NETWORK_SIZE"    => "256",
            "FLAT_INTERFACE"        => "eth0"
        }
    end

    # Download ubuntu image
    config.vm.provision "shell" do |shell|
        shell.inline = "cd /home/vagrant && wget https://cloud-images.ubuntu.com/trusty/current/trusty-server-cloudimg-amd64-disk1.img"
        shell.privileged = false
    end

    # Import ubuntu on glance
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
