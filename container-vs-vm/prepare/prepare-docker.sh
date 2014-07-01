#!/bin/bash

IMAGE_NAME=`cat DOCKER-IMAGE-NAME`

docker build -t $IMAGE_NAME .
docker images
