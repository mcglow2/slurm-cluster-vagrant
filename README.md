SLURM Vagrant Cluster
=====================

A demo SLURM cluster running in Vagrant virtual machines.  Slurm is downloaded and built from source automatically.  

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
- Rocky Linux 9
- Vagrant 2.4.1
- Slurm 22.05.11

---

https://manski.net/articles/vagrant/multi-machine-tutorial
http://mussolblog.wordpress.com/2013/07/17/setting-up-a-testing-slurm-cluster/
