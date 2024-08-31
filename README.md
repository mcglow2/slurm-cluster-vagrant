SLURM Vagrant Cluster
=====================

A demo SLURM cluster running in Vagrant virtual machines.

# Usage

Build VM's

```
vagrant up
```

Install and Start SLURM daemons inside VM's

```
vagrant up --provision-with slurm
```

Configure slurm with a set of test users, partitions, QOS's and Accounts
```
vagrant up --provision-with sample-data
```


Test that it is working

```
vagrant up --provision-with test
```

# Software

Tested with:

- Vagrant 2.0.1

- SLURM 15.08.7 (Ubuntu 16.04)

---

https://manski.net/articles/vagrant/multi-machine-tutorial
http://mussolblog.wordpress.com/2013/07/17/setting-up-a-testing-slurm-cluster/
