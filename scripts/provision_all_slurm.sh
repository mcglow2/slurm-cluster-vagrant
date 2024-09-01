#!/usr/bin/bash



yum install -y rpm-build vim json-c freeipmi munge http-parser libyaml pam-devel mariadb-connector-c-devel autoconf automake gcc munge-libs readline-devel

useradd slurm
useradd raccoon
useradd fox
useradd chicken
useradd duck

groupadd coop
sudo usermod --append --groups coop duck
sudo usermod --append --groups coop chicken

