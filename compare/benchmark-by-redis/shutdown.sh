#!/bin/bash


echo "==> Shutdown unused services..."


echo "==> Shutdown native Redis server..."
sudo service redis-server stop


echo "==> Shutdown Dockerized Redis server..."
docker stop redis
docker rm redis


echo "==> Shutdown VM..."
vagrant halt


echo "==> Done."
