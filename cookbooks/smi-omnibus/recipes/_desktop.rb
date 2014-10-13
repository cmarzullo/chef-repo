
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

# need to change runlevel
#sed -i '/id:3:initdefault:/c\id:5:initdefault:' inittab
execute 'Set Run Level' do
	command "sed -i '/id:3:initdefault:/c\id:5:initdefault:' /etc/inittab"
	not_if 'grep ^id:5 /etc/inittab' 
	notifies :run, 'execute[init 5]', :immediately
end

execute 'init 5' do
	action :nothing
end

