# This recipe will setup the vbox guest additions

case node['platform_family']
when 'rhel'

	# Repo for Virtual Box HV. Not needed for guest
	if node[:vbox][:repo][:enabled]
		yum_repository 'virtualbox' do
			baseurl     node[:vbox][:repo][:baseurl]
			description node[:vbox][:repo][:description]
			enabled     node[:vbox][:repo][:enabled]
			gpgcheck    node[:vbox][:repo][:gpgcheck]
			gpgkey      node[:vbox][:repo][:gpgkey]

			action :create
		end
	end
	
	# Install Packages
	node[:vbox][:guest][:packages].each do |p|
		package p do
			action :install
		end
	end

	# Download ISO
	remote_file node[:vbox][:guest][:uri_dest] do
		source node[:vbox][:guest][:uri_full]
		action :create_if_missing
	end

	# Create and Mount
	directory node[:vbox][:guest][:mount_point] do
		owner 'root'
		group 'root'
		mode  '0755'
		action :create
		not_if { ::File.directory?(node[:vbox][:guest][:mount_point]) }
	end
	mount node[:vbox][:guest][:mount_point] do
		action [:mount, :enable]
		device node[:vbox][:guest][:uri_dest]
		fstype 'iso9660'
		options 'loop'
		only_if { Dir["#{node[:vbox][:guest][:mount_point]}/*"].empty? }
	end

end
