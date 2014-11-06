# "Shared Kernel" and root file system features of Docker


This directory is to demostrate the "shared kernel" and root file system features of Docker, using [show-kernel-info.sh](show-kernel-info.sh) as example.



## For the impatient

See my screencast: ["Shared Kernel" and root file system features of Docker](http://youtu.be/JxlZuyfnjMQ).


## Preparation

Prepare environments for experiment.

**CAUTION: This may take minutes. Do it at a place with good bandwidth.**

```
$ ./prepare.sh
```


## Usage


### Baseline: native info

For the CentOS case:

```
$ cd centos
$ vagrant up
$ vagrant ssh -c "cd /vagrant ; ./show-kernel-info.sh"
```

For the Ubuntu case:

```
$ cd ubuntu-with-docker-image
$ vagrant up
$ vagrant ssh -c "cd /vagrant ; ./show-kernel-info.sh"
```

For the CoreOS case:

```
$ cd coreos-with-docker-image
$ vagrant up
$ vagrant ssh -c "cd /vagrant ; ./show-kernel-info.sh"
```


### Dockerized info


For the Ubuntu case:

```
$ cd ubuntu-with-docker-image
$ vagrant up
$ vagrant ssh -c "docker run --rm williamyeh/show-kernel-info"
```

For the CoreOS case:

```
$ cd coreos-with-docker-image
$ vagrant up
$ vagrant ssh -c "docker run --rm williamyeh/show-kernel-info"
```
