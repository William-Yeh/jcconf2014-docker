#!/bin/bash

BOX_FILE=demo-trusty-mongo.box
BOX_NAME=williamyeh/demo/trusty-mongo


vagrant up
vagrant package --output $BOX_FILE
vagrant box add --name $BOX_NAME  $BOX_FILE
vagrant box list
rm $BOX_FILE
