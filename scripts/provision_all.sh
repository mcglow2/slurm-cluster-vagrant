#!/usr/bin/bash

echo "Setting up host file"
echo "10.10.10.9    login" >> /etc/hosts
echo "10.10.10.10    controller" >> /etc/hosts
echo "10.10.10.11    node01" >> /etc/hosts
echo "10.10.10.12    node02" >> /etc/hosts
echo "10.10.10.13    node03" >> /etc/hosts
echo "10.10.10.14    node04" >> /etc/hosts
echo "10.10.10.15    node05" >> /etc/hosts
echo "10.10.10.16    node06" >> /etc/hosts
echo "10.10.10.17    node07" >> /etc/hosts
echo "10.10.10.18    node08" >> /etc/hosts
echo "10.10.10.19    node09" >> /etc/hosts
echo "10.10.10.20    node10" >> /etc/hosts



dnf -y install epel-release
dnf config-manager --set-enabled crb

dnf -y update