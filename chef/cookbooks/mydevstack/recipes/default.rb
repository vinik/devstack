#
# Cookbook Name:: mydevstack
# Recipe:: default
#
# Copyright (C) 2016 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'git'

git "/home/vagrant/devstack" do
  user        'vagrant'
  group       'vagrant'
  repository  'https://git.openstack.org/openstack-dev/devstack'
  reference   'master'
  action      :sync
end
