#!/bin/bash
#
# provision script; install & run MongoDB
#
# [NOTE] run by Vagrant; never run on host OS. 
#


export DEBIAN_FRONTEND=noninteractive
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list

apt-get update  &&  apt-get install -y -q mongodb-org
apt-get clean

#sudo /usr/sbin/invoke-rc.d mongod stop
sed -i -re 's/^\s*(bind_ip\s*=.*)/#\1\n#--> listen on all for vagrant host OS to access\nbind_ip=0.0.0.0/' /etc/mongod.conf


cat <<EOF  >> /home/vagrant/.bashrc
export LC_CTYPE=C.UTF-8
lsb_release -a
EOF
