
#default[:postgresql][:config][:listen_addresses] = 'localhost'
default[:postgresql][:config][:listen_addresses] = 'localhost,*'
#default[:postgresql][:config][:wal_buffers] = 'minimal'
#default[:postgresql][:enable_pgdg_yum] = true
#override[:postgresql][:version] = '9.2'
default[:postgresql][:config_pgtune][:db_type] = 'web'
#default[:postgresql][:password][:postgres] = 'password'
#default[:postgresql][:password][:postgres] = 'md532e12f215ba27cb750c9e093ce4b5127'
#deault[:pstgresql][:pg_hba] = []

