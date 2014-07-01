#!/bin/bash

BOX_NAME=`cat VAGRANT-BOX-NAME`
IMAGE_NAME=`cat DOCKER-IMAGE-NAME`

echo Uninstalling Vagrant box: $BOX_NAME
vagrant halt
vagrant destroy
vagrant box remove $BOX_NAME
rm -rf .vagrant

echo Uninstalling Docker image: $IMAGE_NAME
docker rmi -f $IMAGE_NAME
