#
# Cookbook Name:: smi-omnibus
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#

# Base Repos First
include_recipe 'smi-omnibus::_yum'

## Do virtualization stuff early
#case node[:virtualization][:system]
#when 'vbox'
#	log 'This VM is vbox'
#	#include_recipe 'smi-omnibus::_vbox'
#when 'vmware'
#	log 'This VM is vmware'
#end

include_recipe 'smi-omnibus::_chef-client'
include_recipe 'smi-omnibus::_git'
include_recipe 'vim'
include_recipe 'ntp'
include_recipe 'smi-omnibus::_iptables'

#include_recipe 'smi-omnibus::_desktop'
