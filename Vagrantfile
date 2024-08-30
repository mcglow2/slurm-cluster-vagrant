# -*- mode: ruby -*-
# vi: set ft=ruby :
#Define the list of machines
slurm_cluster = {
    :controller => {
        :hostname => "controller",
        :ipaddress => "10.10.10.3"
    },
    :server => {
        :hostname => "server",
        :ipaddress => "10.10.10.4"
    }
}

#Provisioning inline script
$script = <<SCRIPT
yum update
yum install -y -q vim nano slurm
echo "10.10.10.3    controller" >> /etc/hosts
echo "10.10.10.4    server" >> /etc/hosts
ln -s /vagrant/slurm.conf /etc/slurm-llnl/slurm.conf
SCRIPT

Vagrant.configure("2") do |global_config|
    slurm_cluster.each_pair do |name, options|
        global_config.vm.define name do |config|
            #VM configurations
            config.vm.box = "rockylinux/9"
            config.vm.hostname = "#{name}"
            config.vm.network :private_network, ip: options[:ipaddress]

            #VM specifications
            config.vm.provider :virtualbox do |v|
                # v.customize ["modifyvm", :id, "--memory", "1024"]
                v.cpus = 1
                v.memory = 1024
            end

            #VM provisioning
            config.vm.provision :shell,
                :inline => $script
        end
    end
end
