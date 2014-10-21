
default[:smimrepo][:cifs][:packages] = %w{ samba-client samba-common cifs-utils }
default[:smimrepo][:cifs][:mount] = '/mrepo-data'
default[:mrepo][:config][:srcdir] = '/mrepo-data'
default[:mrepo][:config][:cron] = 'weekly'
default[:mrepo][:config][:cachedir] =  '/mrepo-data/cache'
default[:mrepo][:config][:createrepo_options] = "-c #{default[:mrepo][:config][:cachedir]} -update --workers 2"
