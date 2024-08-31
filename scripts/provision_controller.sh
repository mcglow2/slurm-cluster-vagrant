#!/usr/bin/bash

echo "provisioning controller" >> /home/vagrant/touch 

#shared keygen for vagrant
ssh-keygen -b 2048 -t rsa -q -N "" -f /home/vagrant/.ssh/id_rsa
cp /home/vagrant/.ssh/id_rsa.pub /vagrant/tmp/id_rsa.controller.pub


