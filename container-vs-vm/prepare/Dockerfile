# Dockerfile for building MongoDB images
# Adapted from https://docs.docker.com/examples/mongodb/

FROM ubuntu:14.04
MAINTAINER William Yeh <william.pjyeh@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list

RUN apt-get update  &&  apt-get install -y -q mongodb-org
RUN mkdir -p /data/db

VOLUME ["/data/db"]
EXPOSE 27017
ENV LC_ALL C.UTF-8
CMD [ "mongod" ]
