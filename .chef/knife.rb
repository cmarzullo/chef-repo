# See http://docs.getchef.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "sevenmanin"
client_key               "#{current_dir}/sevenmanin.pem"
validation_client_name   "sevenmen-validator"
validation_key           "#{current_dir}/sevenmen-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/sevenmen"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]

# Knife Values
knife[:editor]   = '/usr/bin/vim'
knife[:ssh_user] = 'root'
knife[:ssh_attribute] = 'name'
ssl_verify_mode :verify_peer

