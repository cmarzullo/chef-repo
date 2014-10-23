# This little wrapper for yum sets some site secific stuff

# Search the Chef server to see if I have a mrepo setup.
repo_node = search(:node, 'name:smia-repo.sevenman.in')
if defined? repo_node
  # TODO Should test if server is up
  repo_ip = "#{repo_node[0][:ipaddress]}"
  # We will assume that all these services are up and set local url's
  
  # CentOS
  node.default[:yum][:base][:mirrorlist] = nil
  node.default[:yum][:extras][:mirrorlist] = nil
  node.default[:yum][:updates][:mirrorlist] = nil
  node.default[:yum][:base][:baseurl] = "http://#{repo_ip}/centos6-x86_64/RPMS.os"
  node.default[:yum][:extras][:baseurl] = "http://#{repo_ip}/centos6-x86_64/RPMS.extras"
  node.default[:yum][:updates][:baseurl] = "http://#{repo_ip}/centos6-x86_64/RPMS.updates"
  # SCL
  node.default[:yum][:scl][:baseurl] = "http://#{repo_ip}/centos6-x86_64/RPMS.scl"
  # Katello
  node.default[:yum][:katello][:baseurl] = "http://#{repo_ip}/katello-x86_64/RPMS.katello"
  node.default[:yum][:katello_candlepin][:baseurl] = "http://#{repo_ip}/katello-x86_64/RPMS.candlepin"
  node.default[:yum][:katello_pulp][:baseurl] = "http://#{repo_ip}/katello-x86_64/RPMS.pulp"
  # Puppet
  node.default[:yum][:puppet][:baseurl] = "http://#{repo_ip}/puppet-x86_64/RPMS.products"
  node.default[:yum][:puppet_deps][:baseurl] = "http://#{repo_ip}/puppet-x86_64/RPMS.dependencies"
  # Foreman
  node.default[:yum][:foreman][:baseurl] = "http://#{repo_ip}/foreman-x86_64/RPMS.releases"
  node.default[:yum][:foreman_plugins][:baseurl] = "http://#{repo_ip}/foreman-x86_64/RPMS.plugins"
end

# Pretty much want these
include_recipe 'yum-centos'
include_recipe 'yum-epel'
