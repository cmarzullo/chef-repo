
default[:smimrepo][:cifs][:packages] = %w{ samba-client samba-common cifs-utils }
default[:smimrepo][:cifs][:mount] = '/srv/mrepo-data'

default[:mrepo][:config][:srcdir] = '/srv/mrepo-data'
