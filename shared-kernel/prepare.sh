#!/bin/bash


echo "==> Preparing environments for "show-kernel-info.sh" ..."

echo "==> Preparing for CentOS case..."
cd centos
vagrant up
vagrant halt
cd ..


echo "==> Preparing for Ubuntu + Docker case..."
cd ubuntu-with-docker-image
vagrant up
vagrant halt
cd ..


echo "==> Preparing for CoreOS + Docker case..."
cd coreos-with-docker-image
vagrant up
vagrant halt
cd ..


echo "==> Done."
