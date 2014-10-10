# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = 'chef/centos-6.5'
  config.vm.boot_timeout = '60'

  config.vm.define 'smia-00' do |smia|

    smia.vm.network 'public_network', ip: '192.168.200.210'
    smia.vm.hostname = 'smia-00'

    smia.vm.provider 'vmware_workstation' do |v|
      # Don't boot with headless mode
      v.gui = true
      v.vmx['memsize'] = 1024
      v.vmx['numvcpus'] = 1
    end

  end

end
