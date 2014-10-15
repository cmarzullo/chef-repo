#
# Cookbook Name:: smi-mrepo
# Recipe:: default
#
# Copyright (C) 2014 Christopher Marzullo
#
# All rights reserved - Do Not Redistribute
#

# Mount Path for Repo and Cache

include_recipe 'mrepo'

mrepo_repository 'centos6' do
  action :create
  desc 'CentOS 6.5 x86_64'
  release '6.5'
  arch 'x86_64'
  iso 'http://mirrors.usc.edu/pub/linux/distributions/centos/6.5/isos/x86_64/CentOS-6.5-x86_64-bin-DVD1.iso'
  metadata 'repomd repoview'
  sources :updates => 'reposync://mirrors.usc.edu/pub/linux/distributions/centos/6.5/updates/x86_64/',
          :extras  => 'reposync://mirrors.usc.edu/pub/linux/distributions/centos/6.5/extras/x86_64/',
          :SCL     => 'reposync://mirrors.usc.edu/pub/linux/distributions/centos/6.5/SCL/x86_64/'
end
