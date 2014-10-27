#
# Cookbook Name:: smi-pgdb
# Recipe:: default
#
# Copyright (C) 2014 Chris Marzullo
#
# All rights reserved - Do Not Redistribute
#
log 'Starting smi pgdb'


include_recipe 'postgresql::server'
include_recipe 'postgresql::config_pgtune'
include_recipe 'postgresql::contrib'

include_recipe 'database::postgresql'

postgresql_connection_info = {
    :host => '127.0.0.1',
    :port => '5432',
    :password => node[:postgresql][:password][:postgres],
  }

postgresql_database 'foreman' do
  connection postgresql_connection_info
  action :create
end

postgresql_database_user 'foreman' do
  connection postgresql_connection_info
  database_name 'foreman'
  password 'foreman!23'
  host '%'
  privileges [:all]
  action :grant
end

#postgresql_database 'cmtest' do
#  connection(
#    :host => '127.0.0.1'
#    :port => '5432'
#    :username => 'cmtest'
#    :password => 'cmtest'
#  )
#  action :create
#end


