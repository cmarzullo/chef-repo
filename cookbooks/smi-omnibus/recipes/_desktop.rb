
# Install Packages
node[:smi][:desktop][:packages].each do |p|
	package p do
		action :install
	end
end
node[:smi][:desktop][:fonts].each do |p|
	package p do
		action :install
	end
end
