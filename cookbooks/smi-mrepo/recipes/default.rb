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
  device '//192.168.200.10/mrepo-data'
  action [:mount, :enable]
  fstype 'cifs'
  options 'username=mrepo,password=mrepo,sec=ntlm'
end

## Setup Repos
include_recipe 'mrepo'

mrepo_repository 'centos6' do
  action :create
  shareiso true
  desc 'CentOS 6.5 x86_64'
  release '6.5'
  arch 'x86_64'
  iso "#{node[:smimrepo][:cifs][:mount]}/iso/CentOS-6.5-x86_64-bin-DVD?.iso"
  metadata 'repomd repoview'
  sources :updates => 'reposync://mirrors.usc.edu/pub/linux/distributions/centos/6.5/updates/x86_64/',
          :extras  => 'reposync://mirrors.usc.edu/pub/linux/distributions/centos/6.5/extras/x86_64/',
          :SCL     => 'reposync://mirrors.usc.edu/pub/linux/distributions/centos/6.5/SCL/x86_64/',
          :epel    => 'reposync://mirrors.usc.edu/pub/linux/distributions/fedora-epel/6/x86_64/'
end

mrepo_repository 'foreman' do
  action :create
  desc 'Foreman 1.6'
  metadata 'repomd repoview'
  sources :releases => 'reposync://yum.theforeman.org/releases/1.6/el6/x86_64/',
          :plugins  => 'reposync://yum.theforeman.org/plugins/1.6/el6/x86_64/'
end

mrepo_repository 'katello' do
  action :create
  desc 'Katello Stable'
  metadata 'repomd repoview'
  sources :katello   => 'reposync://fedorapeople.org/groups/katello/releases/yum/2.0/katello/RHEL/6/x86_64/',
          :candlepin => 'reposync://fedorapeople.org/groups/katello/releases/yum/2.0/candlepin/RHEL/6/x86_64/',
          :pulp      => 'reposync://fedorapeople.org/groups/katello/releases/yum/2.0/pulp/RHEL/6/x86_64/'
end

mrepo_repository 'puppet' do
  action :create
  desc 'Puppet Labs Products and Dependencies EL 6 - x86_64'
  metadata 'repomd repoview'
  sources :products     => 'reposync://yum.puppetlabs.com/el/6/products/x86_64',
          :dependencies => 'reposync://yum.puppetlabs.com/el/6/dependencies/x86_64'
end
