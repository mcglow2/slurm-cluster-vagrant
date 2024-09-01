#!/usr/bin/bash
echo "Installing Slurm via Vagrant"

echo "running slurm config" >> /home/vagrant/touch 

yum install -y munge
cp /vagrant/tmp/munge.key /etc/munge/munge.key
chmod 600 /etc/munge/munge.key
chown munge /etc/munge/munge.key
service munge start

yum install -y nano dbus-devel kernel-headers rpm-build vim perl-ExtUtils-MakeMaker json-c freeipmi munge http-parser libyaml pam-devel mariadb-connector-c-devel mariadb-devel autoconf automake gcc munge-libs munge-devel readline-devel

useradd slurm
rpm -i /vagrant/tmp/rpms/slurm-22.05.11-1.el9.x86_64.rpm --reinstall
#rpm -i /vagrant/tmp/rpms/slurm-pam_slurm-22.05.11-1.el9.x86_64.rpm
#rpm -i /vagrant/tmp/rpms/slurm-contribs-22.05.11-1.el9.x86_64.rpm
rpm -i /vagrant/tmp/rpms/slurm-perlapi-22.05.11-1.el9.x86_64.rpm --reinstall
#rpm -i /vagrant/tmp/rpms/slurm-devel-22.05.11-1.el9.x86_64.rpm
#rpm -i /vagrant/tmp/rpms/slurm-slurmctld-22.05.11-1.el9.x86_64.rpm
#rpm -i /vagrant/tmp/rpms/slurm-example-configs-22.05.11-1.el9.x86_64.rpm
rpm -i /vagrant/tmp/rpms/slurm-slurmd-22.05.11-1.el9.x86_64.rpm --reinstall
#rpm -i /vagrant/tmp/rpms/slurm-libpmi-22.05.11-1.el9.x86_64.rpm
#rpm -i /vagrant/tmp/rpms/slurm-slurmdbd-22.05.11-1.el9.x86_64.rpm
#rpm -i /vagrant/tmp/rpms/slurm-openlava-22.05.11-1.el9.x86_64.rpm
#rpm -i /vagrant/tmp/rpms/slurm-torque-22.05.11-1.el9.x86_64.rpm

#Copy config over
mkdir /etc/slurm
#cp /vagrant/slurm /etc/slurm
cp /vagrant/slurm.conf /etc/slurm/slurm.conf
cp /vagrant/cgroup.conf /etc/slurm/cgroup.conf

chown -R slurm /etc/slurm

#Start slurm
service slurmd start



#Common stuff

useradd raccoon
useradd fox
useradd chicken
useradd duck

groupadd coop
sudo usermod --append --groups coop duck
sudo usermod --append --groups coop chicken