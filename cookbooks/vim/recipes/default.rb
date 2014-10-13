#
# Cookbook Name:: vim
# Recipe:: default
#
# Copyright 2014, Seven Men Industries
#
# All rights reserved - Do Not Redistribute
#

package 'vim' do
  action :install
end

cookbook_file '/etc/skel/.vimrc' do
  source 'dot_vimrc'
  owner 'root'
  group 'root'
  mode '0644'
end

# VIM directories
%w[/etc/skel/.vim
   /etc/skel/.vim/autoload
   /etc/skel/.vim/colors
   /etc/skel/.vim/bundle].each do |path|
  directory path do
    owner 'root'
    group 'root'
    mode '0644'
  end
end

# Download Pathogen
# https://github.com/tpope/vim-pathogen
remote_file '/etc/skel/.vim/autoload/pathogen.vim' do
  source 'https://tpo.pe/pathogen.vim'
  owner 'root'
  group 'root'
  mode '0644'
end

# Install xoria256 colorscheme
# http://www.vim.org/scripts/script.php?script_id=2140
remote_file '/etc/skel/.vim/colors/xoria256.vim' do
  source 'http://www.vim.org/scripts/download_script.php?src_id=15762'
  owner 'root'
  group 'root'
  mode '0644'
end

# Install elzr/vim-json
# https://github.com/elzr/vim-json
git '/etc/skel/.vim/bundle/vim-json' do
  repository 'https://github.com/elzr/vim-json.git'
end

