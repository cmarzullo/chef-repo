name             'smi-omnibus'
maintainer       'seenmanin'
maintainer_email 'sevenmanin@gmail.com'
license          'All rights reserved'
description      'Installs/Configures smi-omnibus'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.1'

depends 'chef-client', '> 3.8.0'
depends 'yum', '> 3.0.0'
depends 'yum-epel', '= 0.5.1'
depends 'yum-centos', '= 0.3.0'
depends 'vim', '= 0.2.0'
depends 'virtualbox-guest-additions-cookbook', '= 0.2.0'
