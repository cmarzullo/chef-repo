# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = 'chef/centos-6.5'
  #config.vm.boot_timeout = '60'

  ## Setup Chef
  config.omnibus.chef_version = :latest
  config.vm.provision :chef_client do |chef|
      chef.chef_server_url = "https://api.opscode.com/organizations/sevenmen"
      chef.validation_client_name = "sevenmen-validator"
      chef.validation_key_path = ".chef/sevenmen-validator.pem"
			chef.delete_node = true
			chef.delete_client = true
	  	chef.add_recipe 'smi-omnibus'
  end

  # Lets make a local mrepo!
  config.vm.define 'smia-repo' do |repo|
    repo.vm.hostname = 'smia-repo.sevenman.in'
    repo.vm.network 'public_network'
    # repo.vm.network 'private_network', ip: '192.168.201.210'

		repo.vm.provider 'virtualbox' do |v|
			v.gui = true
			v.memory = 1024
			v.cpus = 1
      v.name = 'smia-repo'
		end

    repo.vm.provision :chef_client do |chef|
      chef.chef_server_url = "https://api.opscode.com/organizations/sevenmen"
      chef.validation_client_name = "sevenmen-validator"
      chef.validation_key_path = ".chef/sevenmen-validator.pem"
	  	chef.add_recipe 'smi-omnibus'
      chef.add_recipe 'smi-mrepo'
    end
  end

  # Katello Server
  config.vm.define 'smia-kat' do |kat|
    kat.vm.hostname = 'smia-katello.sevenman.in'
    kat.vm.network 'public_network'

    kat.vm.provider 'virtualbox' do |v|
      v.gui = true
      v.memory = 4096
      v.cpus = 4
      v.name = 'smia-katello'
    end
    kat.vm.provision :chef_client do |chef|
      chef.chef_server_url = "https://api.opscode.com/organizations/sevenmen"
      chef.validation_client_name = "sevenmen-validator"
      chef.validation_key_path = ".chef/sevenmen-validator.pem"
	  	chef.add_recipe 'smi-omnibus'
      chef.add_recipe 'smi-katello'
    end
  end


	## This is a Developer Workstation
	config.vm.define 'smid-00' do |smid|
    smid.vm.hostname = 'smid-00'
    smid.vm.network 'public_network'
    smid.vm.network 'private_network', ip: '192.168.70.3'

		# Do virtual Box settings
		smid.vm.provider 'virtualbox' do |v|
			v.gui = true
			v.memory = 1536
		end
    
    # VMware Specifics
    smid.vm.provider 'vmware_workstation' do |v|
      v.gui = true
      v.vmx['memsize'] = 2048
      v.vmx['numvcpus'] = 1
    end
	end

end
