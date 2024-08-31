#!/usr/bin/bash
echo "Installing Slurm via Vagrant"
echo "running slurm config" >> /home/vagrant/touch 

yum install -y munge
create-munge-key
service munge start
cp /etc/munge/munge.key /vagrant/tmp/munge.key

SLURM_VERSION=22.05.11
yum install -y rpm-build vim perl-ExtUtils-MakeMaker json-c freeipmi munge http-parser libyaml pam-devel mariadb-connector-c-devel mariadb-devel autoconf automake gcc munge-libs munge-devel readline-devel

echo "\n"
echo "Installing Slurm version $SLURM_VERSION \n"

if [ ! -f /vagrant/tmp/rpms/slurm-$SLURM_VERSION-1.el9.x86_64.rpm ]; then
    echo "RPMs not found! Building"

	#23.11.10  22.05.11 24.05.3.tar.bz2
	#Provisioning inline script
	wget https://download.schedmd.com/slurm/slurm-$SLURM_VERSION.tar.bz2
	rpmbuild -ta slurm-$SLURM_VERSION.tar.bz2

	mkdir /vagrant/rpms
	cp /home/vagrant/rpmbuild/RPMS/x86_64/* /vagrant/tmp/rpms
fi

useradd slurm

rpm -i /vagrant/tmp/rpms/slurm-$SLURM_VERSION-1.el9.x86_64.rpm
#rpm -i /vagrant/tmp/rpms/slurm-pam_slurm-$SLURM_VERSION-1.el9.x86_64.rpm
#rpm -i /vagrant/tmp/rpms/slurm-contribs-$SLURM_VERSION-1.el9.x86_64.rpm
rpm -i /vagrant/tmp/rpms/slurm-perlapi-$SLURM_VERSION-1.el9.x86_64.rpm
#rpm -i /vagrant/tmp/rpms/slurm-devel-$SLURM_VERSION-1.el9.x86_64.rpm
rpm -i /vagrant/tmp/rpms/slurm-slurmctld-$SLURM_VERSION-1.el9.x86_64.rpm
#rpm -i /vagrant/tmp/rpms/slurm-example-configs-$SLURM_VERSION-1.el9.x86_64.rpm
#rpm -i /vagrant/tmp/rpms/slurm-slurmd-$SLURM_VERSION-1.el9.x86_64.rpm
#rpm -i /vagrant/tmp/rpms/slurm-libpmi-$SLURM_VERSION-1.el9.x86_64.rpm
rpm -i /vagrant/tmp/rpms/slurm-slurmdbd-$SLURM_VERSION-1.el9.x86_64.rpm
#rpm -i /vagrant/tmp/rpms/slurm-openlava-$SLURM_VERSION-1.el9.x86_64.rpm
#rpm -i /vagrant/tmp/rpms/slurm-torque-$SLURM_VERSION-1.el9.x86_64.rpm

#Copy config over
mkdir /etc/slurm
#cp /vagrant/slurm /etc/slurm
cp /vagrant/slurm.conf /etc/slurm/slurm.conf
chown -R slurm /etc/slurm

#Start slurm
service slurmd start




#Common stuff
#yum install -y rpm-build vim perl-ExtUtils-MakeMaker json-c freeipmi munge http-parser libyaml pam-devel mariadb-connector-c-devel mariadb-devel autoconf automake gcc munge-libs munge-devel readline-devel




useradd raccoon
useradd fox
useradd chicken
useradd duck

groupadd coop
sudo usermod --append --groups coop duck
sudo usermod --append --groups coop chicken