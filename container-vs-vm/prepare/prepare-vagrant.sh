#!/bin/bash

BOX_NAME=`cat VAGRANT-BOX-NAME`
BOX_FILE=demo-trusty-mongo.box


vagrant up
vagrant package --output $BOX_FILE
vagrant box add --name $BOX_NAME  $BOX_FILE
vagrant box list


rm $BOX_FILE
vagrant destroy
