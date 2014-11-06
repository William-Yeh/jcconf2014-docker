# Benchmark Comparison: Native vs. VM vs. Docker


This directory is to compare performance among native, VM and Dockerized server processes, using [Redis](http://redis.io/) as example.

For more realistic result, please run this task in a *bare metal* machine with Linux + Docker installed. Let the Linux run at full speed as the *host OS*.  See [PREREQUISITE memo](PREREQUISITE.md) for details.



## For the impatient

See my screencast: [Redis benchmark in native Linux mode, Linux VM, and Docker container ](http://youtu.be/Qow-sXNM0pQ).


## Preparation

Prepare Redis environments for experiment.

**CAUTION: This may take minutes. Do it at a place with good bandwidth.**

```
$ ./prepare.sh
```


## Usage


### Service startup time

Shutdown services in advance, and then activate them one by one:

```
$ ./shutdown.sh
$ ./show-startup-time.sh
```



### Run benchmark!

Shutdown services in advance:

```
$ ./shutdown.sh
```


For the native case:

```
$ ./run-native.sh
```


For the VM case:

```
$ ./run-vm.sh
```


For the Docker case:

```
$ ./run-docker.sh
```


If everything is OK, you'll obtain benchmark result files `result.*` for each case.


### Inspect processes

If you're interested in the process view of the 3 cases:

```
$ ps aux | grep redis
```

Or, display the process hierarchy trees:

```
$ ps faux
```


### Stop & clean up running states

```
$ ./shutdown.sh
```
