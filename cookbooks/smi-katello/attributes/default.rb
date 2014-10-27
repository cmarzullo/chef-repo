
# TODO don't think this is needed anymore
default[:yum][:localrepo] = true

default[:katello][:installer]['foreman::plugin::chef'] = true
#default[:katello][:installer][:capsule][:pulp_oauth_key] = 'katello'
#default[:katello][:installer][:capsule][:pulp_oauth_secret] = 'katello'
default[:katello][:installer][:capsule][:tftp] = true
default[:katello][:installer][:certs][:ca][:city] = 'Los Angeles'
default[:katello][:installer][:certs][:ca][:common_name] = 'smia-katello.sevenman.in'
default[:katello][:installer][:certs][:ca][:country] = 'United States'
default[:katello][:installer][:certs][:ca][:state] = 'California'
default[:katello][:installer][:certs][:default_ca_name] = 'katello-default-ca'
default[:katello][:installer][:certs][:default_server_ca_name] = 'katello-server-ca'
default[:katello][:installer][:certs][:org] = 'Seven Man Industries'
default[:katello][:installer][:certs][:org_unit] = 'Research and Development'
default[:katello][:installer][:foreman][:initial_location] = 'VM Lab'
default[:katello][:installer][:foreman][:initial_organization] = 'Seven Man Industries'
default[:katello][:installer][:foreman][:admin_password] = 'lazin1'
#default[:katello][:installer][:foreman][:configure_epel_repo] = true
#default[:katello][:installer][:foreman][:configure_ipa_repo] = true
#default[:katello][:installer][:foreman][:configure_scl_repo] = true

