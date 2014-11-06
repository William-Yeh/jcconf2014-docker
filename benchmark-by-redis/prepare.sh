#!/bin/bash


echo "==> Preparing environments for benchmarking..."

echo "==> Preparing for native case..."
sudo ./install-redis.sh
sudo service redis-server stop

echo "==> Preparing for VM case..."
vagrant up
vagrant halt

echo "==> Preparing for Docker case..."
sudo docker pull williamyeh/redis

echo "==> Done."
