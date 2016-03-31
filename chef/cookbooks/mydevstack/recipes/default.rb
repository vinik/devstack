#
# Cookbook Name:: mydevstack
# Recipe:: default
#
# Copyright (C) 2016 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

user 'stack' do
  comment  'Devstack User'
  shell    '/bin/bash'
  home     '/home/stack'
  supports :manage_home => true
  # not_if { File.exists?("/home/vagrant/.bashrc") }
end

sudo 'stack' do
  user      'stack'   # or a username
  commands  ['ALL']
  nopasswd  true
end


include_recipe 'git'

git "/home/stack/devstack" do
  user        'stack'
  group       'stack'
  repository  'https://git.openstack.org/openstack-dev/devstack'
  reference   'master'
  action      :sync
end

git "/home/vagrant/devstack" do
  user        'vagrant'
  group       'vagrant'
  repository  'https://git.openstack.org/openstack-dev/devstack'
  reference   'master'
  action      :sync
end

file '/etc/rc.local' do
    content '[[local|localrc]]
ADMIN_PASSWORD=secret
DATABASE_PASSWORD=$ADMIN_PASSWORD
RABBIT_PASSWORD=$ADMIN_PASSWORD
SERVICE_PASSWORD=$ADMIN_PASSWORD
#FIXED_RANGE=172.31.1.0/24
#FLOATING_RANGE=192.168.20.0/25
#HOST_IP=10.3.4.5
exit 0'
end
