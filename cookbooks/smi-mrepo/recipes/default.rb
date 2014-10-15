#
# Cookbook Name:: smi-mrepo
# Recipe:: default
#
# Copyright (C) 2014 Christopher Marzullo
#
# All rights reserved - Do Not Redistribute
#

# Setup Mount for data
node[:smimrepo][:cifs][:packages].each do |p|
  package p do
    action :install
  end
end
directory node[:smimrepo][:cifs][:mount] do
  action :create
end
mount node[:smimrepo][:cifs][:mount] do
  device '//192.168.200.16/mrepo-data'
  action [:mount, :enable]
  fstype 'cifs'
  options 'username=mrepo,password=mrepo'
end

## Setup Repos
include_recipe 'mrepo'

mrepo_repository 'centos6' do
  action :create
  desc 'CentOS 6.5 x86_64'
  release '6.5'
  arch 'x86_64'
  iso "#{node[:smimrepo][:cifs][:mount]}/iso/CentOS-6.5-x86_64-bin-DVD?.iso"
  metadata 'repomd repoview'
  sources :updates => 'reposync://mirrors.usc.edu/pub/linux/distributions/centos/6.5/updates/x86_64/',
          :extras  => 'reposync://mirrors.usc.edu/pub/linux/distributions/centos/6.5/extras/x86_64/',
          :SCL     => 'reposync://mirrors.usc.edu/pub/linux/distributions/centos/6.5/SCL/x86_64/'
end
