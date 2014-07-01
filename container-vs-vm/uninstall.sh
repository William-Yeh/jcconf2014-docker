#!/bin/bash

vagrant halt
vagrant destroy
rm -rf .vagrant

sudo docker stop db1 db2
sudo docker rm `sudo docker ps --no-trunc -a -q`
