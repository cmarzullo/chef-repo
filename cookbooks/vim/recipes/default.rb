#
# Cookbook Name:: vim
# Recipe:: default
#
# Copyright 2014, Seven Man Industries
#
# All rights reserved - Do Not Redistribute
#

package 'vim' do
  action :install
end

cookbook_file '/etc/skel/.vimrc' do
    source 'dot_vimrc'
    mode '0644'
end
