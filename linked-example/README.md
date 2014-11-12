# "Linked containers" feature of Docker


This directory is to demostrate the "linked containers" feature of Docker, using [wrk](https://github.com/William-Yeh/docker-wrk) (written in C), [Spray](https://github.com/William-Yeh/Docker-Spray-HttpServer) (written in Scala) as example.



## Preparation

Prepare environments for experiment.

**CAUTION: This may take minutes. Do it at a place with good bandwidth.**


- If you'd like to use Docker directly:

  ```
  $ docker pull williamyeh/wrk:latest
  $ docker pull williamyeh/spray-httpserver:latest
  ```


- Otherwise, if you'd like to use [VirtualBox](https://www.virtualbox.org/) and [Vagrant](http://www.vagrantup.com/) to try this experiment:

  ```
  $ vagrant up --provision
  $ vagrant ssh
  vagrant$  cd /vagrant
  ```



## Usage


1. Start the http server (with the name `spray`):

   ```
   $ docker run -d --name spray williamyeh/spray-httpserver
   ```

2. Tail the logs of the http server, and keep this console open:

   ```
   $ docker logs -f spray
   ```

3. Open another console.  Use `wrk` to benchmark the http server:

   ```
   $ docker run --link spray:httpserver \
         williamyeh/wrk  http://httpserver:8080/
   ```


4. Use `wrk` to benchmark the http server, with random IPs as input:

   ```
   $ docker run --link spray:httpserver  -v `pwd`:/data  \
         williamyeh/wrk  -s wrk-script.lua  http://httpserver:8080/

   ```
