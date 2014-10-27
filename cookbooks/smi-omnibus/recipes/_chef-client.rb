
#chef_gem 'chef_handler_foreman' do
#  action :install
#end

include_recipe 'chef-client::config'
include_recipe 'chef-client'
