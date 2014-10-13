# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = 'chef/centos-6.5'
  #config.vm.boot_timeout = '60'

  ## Setup Chef
  config.omnibus.chef_version = :latest
  #config.vm.provision :chef_client do |chef|
  #  chef.chef_server_url = "https://api.opscode.com/organizations/sevenmen"
  #  chef.validation_client_name = "sevenmen-validator"
  #  chef.validation_key_path = ".chef/sevenmen-validator.pem"
	#	chef.add_role 'base'
  #end

  # Build first node
  config.vm.define 'smia-00' do |smia|

    smia.vm.network 'public_network', ip: '192.168.200.210'
    smia.vm.hostname = 'smia-00'

    # VMware Specifics
    smia.vm.provider 'vmware_workstation' do |v|
      # Don't boot with headless mode
      v.gui = true
      v.vmx['memsize'] = 1024
      v.vmx['numvcpus'] = 1
    end

		smia.vm.provider 'virtualbox' do |v|
			v.gui = true
		end

  end

	## This is a Developer Workstation
	config.vm.define 'smid-00' do |smid|
    smid.vm.hostname = 'smid-00'
		smid.vm.network 'public_network' 

		# Do virtual Box settings
		smid.vm.provider 'virtualbox' do |v|
			v.gui = true
			v.memory = 1536
		end

		# Set Up Chef
    smid.vm.provision :chef_client do |chef|
      chef.chef_server_url = "https://api.opscode.com/organizations/sevenmen"
      chef.validation_client_name = "sevenmen-validator"
      chef.validation_key_path = ".chef/sevenmen-validator.pem"
			chef.delete_node = true
			chef.delete_client = true
	  	chef.add_recipe 'smi-omnibus'
    end

	end

end
