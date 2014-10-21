# This little wrapper for yum sets some site secific stuff

# Search the Chef server to see if I have a mrepo setup.
repo_node = search(:node, 'name:smia-repo.sevenman.in')
if defined? repo_node
  # TODO Should test if server is up
  repo_ip = "#{repo_node[0][:ipaddress]}"
  node.default[:yum][:base][:mirrorlist] = nil
  node.default[:yum][:extras][:mirrorlist] = nil
  node.default[:yum][:updates][:mirrorlist] = nil
  node.default[:yum][:base][:baseurl] = "http://#{repo_ip}/centos6-x86_64/RPMS.os"
  node.default[:yum][:extras][:baseurl] = "http://#{repo_ip}/centos6-x86_64/RPMS.extras"
  node.default[:yum][:updates][:baseurl] = "http://#{repo_ip}/centos6-x86_64/RPMS.updates"
end

# Pretty much want these
include_recipe 'yum-centos'
include_recipe 'yum-epel'
