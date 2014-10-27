
# Chef Client settings
default[:chef_client][:load_gems][:chef_handler_foreman][:require_name] = 'chef_handler_foreman'
default[:chef_client][:config][:ssl_verify_mode] = ':verify_peer'
default[:chef_client][:config][:client_fork] = true
default[:chef_client][:config][:chef_server_url] = 'https://api.opscode.com/organizations/sevenmen'
default[:chef_client][:config][:validation_client_name] = 'sevenmen-validator'
default[:chef_client][:config][:validation_key] = '/etc/chef/sevenmen-validator.pem'
default[:chef_client][:config][:foreman_facts_upload] = true
default[:chef_client][:config][:foreman_reports_upload] = true

default[:chef_client][:config][:foreman_server_options] = ":url => \'https://smia-katello.sevenman.in/\', :foreman_ssl_ca => \'/etc/rhsm/ca/katello-server-ca.pem\', :foreman_ssl_cert => \'/etc/pki/consumer/cert.pem\', :foreman_ssl_key => \'/etc/pki/consumer/key.pem\'"

#default[:chef_client][:config][:report_handlers] = true
default[:chef_client][:config][:reports_log_level] = 'notice'

# Yum Globals
default[:yum][:main][:keepcache] = true
default[:yum][:epel_subcription_manager][:baseurl] = 'http://repos.fedorapeople.org/repos/candlepin/subscription-manager/epel-$releasever/$basearch/'
default[:yum][:epel_subcription_manager][:description] = 'Tools and libraries for Red Hat subscription management.'
default[:yum][:epel_subcription_manager][:gpgcheck] = false

# Virtual Box Repo Information
# information is from: http://wiki.centos.org/HowTos/Virtualization/VirtualBox
default[:vbox][:repo][:baseurl] = 'http://download.virtualbox.org/virtualbox/rpm/el/$releasever/$basearch'
default[:vbox][:repo][:description] = 'Oracle Linux / RHEL / CentOS-$releasever / $basearch - VirtualBox'
default[:vbox][:repo][:enabled] = false
default[:vbox][:repo][:gpgcheck] = true
default[:vbox][:repo][:gpgkey] = 'https://www.virtualbox.org/download/oracle_vbox.asc'

# Virtual Box Guest Additions Information
default[:vbox][:guest][:packages] = %W[make gcc kernel-devel kernel-headers dkms]
default[:vbox][:guest][:version] = '4.3.12'
default[:vbox][:guest][:uri_host] = 'http://download.virtualbox.org'
default[:vbox][:guest][:uri_path] = "virtualbox/#{node[:vbox][:guest][:version]}"
default[:vbox][:guest][:uri_file] = "VBoxGuestAdditions_#{node[:vbox][:guest][:version]}.iso"
default[:vbox][:guest][:uri_full] = "#{node[:vbox][:guest][:uri_host]}/#{node[:vbox][:guest][:uri_path]}/#{node[:vbox][:guest][:uri_file]}"
default[:vbox][:guest][:uri_dest] = "#{Chef::Config[:file_cache_path]}/vboxAdditions.iso"
default[:vbox][:guest][:mount_point] = '/mnt/vboxAdditions'

# Desktop
default[:smi][:desktop][:packages] = %W[
																			cairo
																			control-center
																			control-center-extra
																			dbus
																			dbus-libs
																			fontconfig
																			freetype
																			gdm
																			glib2
																			gtk2
																			gcalctool
																			gedit
																			glx-utils
																			gnome-backgrounds
																			gnome-disk-utility
																			gnome-panel
																			gnome-power-manager
																			gnome-session
																			gnome-themes
																			gnome-terminal
																			gnome-utils
																			hal
																			ibus-gtk
																			ibus-qt
																			ibus-table-additional
																			libICE
																			libSM
																			libX11
																			libXext
																			libXft
																			libXi
																			libXrender
																			libXt
																			libXtst
																			libpng
																			libxml2
																			mesa-libGL
																			mesa-libGLU
																			metacity
																			nautilus
																			openssh-askpass
																			pango
																			polkit-gnome
																			plymouth-system-theme
																			qt
																			qt3
																			xdg-user-dirs-gtk
																			xorg-x11-drivers
																			xorg-x11-server-Xorg
																			xorg-x11-server-utils
																			xorg-x11-utils
																			xorg-x11-xauth
																			xorg-x11-xinit
                                     ]
default[:smi][:desktop][:fonts] = %W[
																		   abyssinica-fonts
																		   dejavu-sans-fonts
																		   dejavu-sans-mono-fonts
																		   dejavu-serif-fonts
																		   liberation-mono-fonts
																		   liberation-sans-fonts
																		   liberation-serif-fonts
																		   lklug-fonts
																		   stix-fonts
																		   un-core-dotum-fonts
																		   vlgothic-fonts
																		   wqy-zenhei-fonts
																		   bitmap-fixed-fonts
																		   bitmap-lucida-typewriter-fonts
																		]
