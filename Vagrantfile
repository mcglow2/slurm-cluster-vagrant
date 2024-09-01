# -*- mode: ruby -*-
# vi: set ft=ruby :

# Every Vagrant development environment requires a box. You can search for
# boxes at https://atlas.hashicorp.com/search.
BOX_IMAGE = "bento/rockylinux-9"
NODE_COUNT = 2

Vagrant.configure("2") do |config|
  config.vm.define "controller" do |subconfig|
    subconfig.vm.box = BOX_IMAGE
    subconfig.vm.hostname = "controller"
    subconfig.vm.network :private_network, ip: "10.10.10.10"
	
	subconfig.vm.provision "shell", path: "scripts/provision_controller.sh", privileged: true, run: "once"
	subconfig.vm.provision "slurm" , type: "shell", path: "scripts/provision_controller_slurm.sh", privileged: true, run: "never"
	#subconfig.vm.provision "slurm" , type: "shell", path: "scripts/provision_all_slurm.sh", privileged: true, run: "never"
	
	#VM specifications
	subconfig.vm.provider :virtualbox do |v|
		v.cpus = 1
		v.memory = 2048
	end
	
  end

  (1..NODE_COUNT).each do |i|
    config.vm.define "node0#{i}" do |subconfig|
      subconfig.vm.box = BOX_IMAGE
      subconfig.vm.hostname = "node0#{i}"
      subconfig.vm.network :private_network, ip: "10.10.10.#{i + 10}"
	  
		subconfig.vm.provision "shell", path: "scripts/provision_node.sh", privileged: true, run: "once"
		subconfig.vm.provision "slurm" , type: "shell", path: "scripts/provision_node_slurm.sh", privileged: true, run: "never"
		#subconfig.vm.provision "slurm" , type: "shell", path: "scripts/provision_all_slurm.sh", privileged: true, run: "never"
	
	
    end
	
	
	#VM specifications
	config.vm.provider :virtualbox do |v|
		v.cpus = 4
		v.memory = 1024
	end
  end

  # Install on all machines
  #config.vm.provision "shell", inline: <<-SHELL
  #  yum install -y nano
  #SHELL
  
  config.vm.provision "shell", path: "scripts/provision_all.sh", privileged: true, run: "once"
  
  #config.vm.provision "clown-test", type: "shell", inline: "echo \"test\" >> /home/vagrant/touch ", privileged: true, run: "never"
  
  #config.vm.provision "hello" , type: "shell", path: "scripts/provision_slurm.sh", privileged: true, run: "never"
  
end