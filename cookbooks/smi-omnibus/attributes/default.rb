
# Chef Client settings
default[:chef_client][:config][:ssl_verify_mode] = ':verify_peer'
default[:chef_client][:config][:client_fork] = true
default[:chef_client][:config][:chef_server_url] = 'https://api.opscode.com/organizations/sevenmen'
default[:chef_client][:config][:validation_client_name] = 'sevenmen-validator'
default[:chef_client][:config][:validation_key] = '/etc/chef/sevenmen-validator.pem'

# Yum Globals
default[:yum][:main][:keepcache] = true

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
																			gnome-gconf-editor
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
																		   cjkuni-uming-fonts
																		   dejavu-sans-fonts
																		   dejavu-sans-mono-fonts
																		   dejavu-serif-fonts
																		   jomolhari-fonts
																		   khmeros-base-fonts
																		   kurdit-unikurd-web-fonts
																		   liberation-mono-fonts
																		   liberation-sans-fonts
																		   liberation-serif-fonts
																		   lklug-fonts
																		   lohit-assamese-fonts
																		   lohit-bengali-fonts
																		   lohit-devanagari-fonts
																		   lohit-gujarati-fonts
																		   lohit-kannada-fonts
																		   lohit-oriya-fonts
																		   lohit-punjabi-fonts
																		   lohit-tamil-fonts
																		   lohit-telugu-fonts
																		   madan-fonts
																		   paktype-naqsh-fonts
																		   paktype-tehreer-fonts
																		   sil-padauk-fonts
																		   smc-meera-fonts
																		   stix-fonts
																		   thai-scalable-waree-fonts
																		   tibetan-machine-uni-fonts
																		   un-core-dotum-fonts
																		   vlgothic-fonts
																		   wqy-zenhei-fonts
																		   aajohan-comfortaa-fonts
																		   bitmap-fixed-fonts
																		   bitmap-lucida-typewriter-fonts
																		   cjkuni-fonts-ghostscript
																		   freefont
																		]
