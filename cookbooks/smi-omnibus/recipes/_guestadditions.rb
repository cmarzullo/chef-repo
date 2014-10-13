# This will install the guest additions depending on the type of vm
#

#include_recipe 'virtualbox-guest-additions-cookbook'

#case node['virtualization']['system']
#when 'vbox'
#	log 'This VM is vbox'
#when 'vmware'
#	log 'This VM is vmware'
#end
