#
# Cookbook Name:: mrepo
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

node[:mrepo][:packages].each do |p|
  package p do
    action :install
  end
end

template '/etc/mrepo.conf' do
  source 'mrepo.conf.erb'
  action :create
  notifies :reload, "service[mrepo]", :delayed
end

service 'mrepo' do
  supports :status => false, :restart => true, :start => true, :stop => true, :reload => true
  action [:enable, :start]
end

