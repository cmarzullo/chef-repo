#!/bin/bash
# cheat file to generate repos

orglabel='Seven_Man_Industries'
http://mirrors.usc.edu/pub/linux/distributions/centos/

# Get CentOS Key
kname='RPM-GPG-KEY-CentOS-6'
wget http://mirrors.usc.edu/pub/linux/distributions/centos/${kname}
hammer gpg create --organization-label $orglabel --key ${kname} --name ${kname} --name ${kname}

# Create CentOS product
hammer product create --organization-label $orglabel --label CentOS_6_5_x86_64 --name 'CentOS 6.5 x86_64' 
hammer repository create --organization-label $orglabel --content-type yum --product 'CentOS 6.5 x86_64' --label updates --name updates --gpg-key ${kname} --url http://192.168.200.100/centos6-x86_64/RPMS.updates/
hammer repository create --organization-label $orglabel --content-type yum --product 'CentOS 6.5 x86_64' --label os --name os --gpg-key ${kname} --url http://192.168.200.100/centos6-x86_64/RPMS.os/
hammer repository create --organization-label $orglabel --content-type yum --product 'CentOS 6.5 x86_64' --label scl --name scl --gpg-key ${kname} --url http://192.168.200.100/centos6-x86_64/RPMS.scl/
hammer repository create --organization-label $orglabel --content-type yum --product 'CentOS 6.5 x86_64' --label extras --name extras --gpg-key ${kname} --url http://192.168.200.100/centos6-x86_64/RPMS.extras/

#
#hammer repository create --organization-label $orglabel --content-type yum --product 'CentOS 6.5 x86_64' --label updates --name updates --gpg-key ${kname} --url http://mirrors.usc.edu/pub/linux/distributions/centos/6.5/updates/x86_64/
#hammer repository create --organization-label $orglabel --content-type yum --product 'CentOS 6.5 x86_64' --label os --name os --gpg-key ${kname} --url http://mirrors.usc.edu/pub/linux/distributions/centos/6.5/os/x86_64/
#hammer repository create --organization-label $orglabel --content-type yum --product 'CentOS 6.5 x86_64' --label scl --name scl --gpg-key ${kname} --url http://mirrors.usc.edu/pub/linux/distributions/centos/6.5/SCL/x86_64/
#hammer repository create --organization-label $orglabel --content-type yum --product 'CentOS 6.5 x86_64' --label extras --name extras --gpg-key ${kname} --url http://mirrors.usc.edu/pub/linux/distributions/centos/6.5/extras/x86_64/
#hammer repository create --organization-label $orglabel --content-type yum --product 'CentOS 6.5 x86_64' --label centosplus --name centosplus --gpg-key ${kname} --url http://mirrors.usc.edu/pub/linux/distributions/centos/6.5/centosplus/x86_64/
#hammer repository create --organization-label $orglabel --content-type yum --product 'CentOS 6.5 x86_64' --label cr --name cr --gpg-key ${kname} --url http://mirrors.usc.edu/pub/linux/distributions/centos/6.5/cr/x86_64/
#hammer repository create --organization-label $orglabel --content-type yum --product 'CentOS 6.5 x86_64' --label fasttrack --name fasttrack --gpg-key ${kname} --url http://mirrors.usc.edu/pub/linux/distributions/centos/6.5/fasttrack/x86_64/

# Create Puppet Product
hammer product create  --organization-label $orglabel --label Puppet_EL6_x86_64 --name 'Puppet EL6 x86_64'
hammer repository create --organization-label $orglabel --content-type yum --product 'Puppet EL6 x86_64' --label products --name products --url https://yum.puppetlabs.com/el/6/products/x86_64/
hammer repository create --organization-label $orglabel --content-type yum --product 'Puppet EL6 x86_64' --label dependencies --name dependencies --url https://yum.puppetlabs.com/el/6/dependencies/x86_64/
hammer product info --name 'Puppet EL6 x86_64' --organization-label $orglabel

# Get Foreman Key
kname='RPM-GPG-KEY-katello-2012.gpg'
wget http://www.katello.org/gpg/${kname}
hammer gpg create --organization-label $orglabel --key ${kname} --name ${kname} --name ${kname}

# Create Katello 2.0 Product
hammer product create  --organization-label $orglabel --label Katello_2_0_EL6_x86_64 --name 'Katello 2.0 EL6 x86_64'
hammer repository create --organization-label $orglabel --content-type yum --product 'Katello 2.0 EL6 x86_64' --label candlepin --name candlepin --url https://fedorapeople.org/groups/katello/releases/yum/2.0/candlepin/RHEL/6/x86_64/
hammer repository create --organization-label $orglabel --content-type yum --product 'Katello 2.0 EL6 x86_64' --label client --name client --url https://fedorapeople.org/groups/katello/releases/yum/2.0/client/RHEL/6/x86_64/
hammer repository create --organization-label $orglabel --content-type yum --product 'Katello 2.0 EL6 x86_64' --label katello --name katello --url https://fedorapeople.org/groups/katello/releases/yum/2.0/katello/RHEL/6/x86_64/
hammer repository create --organization-label $orglabel --content-type yum --product 'Katello 2.0 EL6 x86_64' --label pulp --name pulp --url https://fedorapeople.org/groups/katello/releases/yum/2.0/pulp/RHEL/6/x86_64/
hammer product info --name 'Katello 2.0 EL6 x86_64' --organization-label $orglabel

# Get Foreman Key
kname='RPM-GPG-KEY-foreman'
wget http://yum.theforeman.org/releases/1.6/${kname}
hammer gpg create --organization-label $orglabel --key ${kname} --name ${kname} --name ${kname}

# Create Foreman Product
hammer product create  --organization-label $orglabel --label Foreman_1_6_EL6_x86_64 --name 'Foreman 1.6 EL6 x86_64'
hammer repository create --organization-label $orglabel --content-type yum --product 'Foreman 1.6 EL6 x86_64' --label plugins --name plugins --gpg-key ${kname} --url http://yum.theforeman.org/plugins/1.6/el6/x86_64/
hammer repository create --organization-label $orglabel --content-type yum --product 'Foreman 1.6 EL6 x86_64' --label releases --name releases --gpg-key ${kname} --url http://yum.theforeman.org/releases/1.6/el6/x86_64/
hammer product info --name 'Foreman 1.6 EL6 x86_64' --organization-label $orglabel

# Get EPEL Key
kname='RPM-GPG-KEY-EPEL-6'
wget http://mirrors.usc.edu/pub/linux/distributions/fedora-epel/${kname}
hammer gpg create --organization-label $orglabel --key ${kname} --name ${kname} --name ${kname}

# Create EPEL Product
hammer product create  --organization-label $orglabel --label EPEL_6_x86_64 --name 'EPEL 6 x86_64'
hammer repository create --organization-label $orglabel --content-type yum --product 'EPEL 6 x86_64' --label epel --name epel --gpg-key ${kname} --url http://192.168.200.100/centos6-x86_64/RPMS.epel/
hammer product info --name 'EPEL 6 x86_64' --organization-label $orglabel
