#!/bin/bash

IMAGE_NAME=`cat DOCKER-IMAGE-NAME`

sudo docker build -t $IMAGE_NAME .
sudo docker images
