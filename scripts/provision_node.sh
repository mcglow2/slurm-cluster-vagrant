#!/usr/bin/bash

echo "provisioning node" >> /home/vagrant/touch

cat /vagrant/tmp/id_rsa.controller.pub >> .ssh/authorized_keys

