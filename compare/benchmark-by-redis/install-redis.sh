#!/bin/bash
#
# Install latest Redis on Ubuntu Linux.
#

readonly TARBALL=http://download.redis.io/redis-stable.tar.gz


DEBIAN_FRONTEND=noninteractive  apt-get update


echo "==> Download, compile, and install..."
cd /tmp
curl -LO $TARBALL
tar xvzf redis-stable.tar.gz
cd redis-stable
make 
make install


echo "==> Copy default configuration..."
cp -f src/redis-sentinel /usr/local/bin
mkdir -p /etc/redis
cp -f *.conf /etc/redis


echo "==> Configure Redis..."
sed -i -e 's/^bind/#bind/' /etc/redis/redis.conf
cd utils
sed -i -e 's/redis_\${REDIS_PORT}/redis-server/' install_server.sh
sed -i -e 's/redis_\$REDIS_PORT/redis-server/'   install_server.sh
cat << CMD | ./install_server.sh
6379
/etc/redis/redis.conf



CMD


echo "==> Clean up..."
cd /tmp
rm -rf /tmp/redis-stable*


echo "==> Restart service..."
service redis-server restart


echo "==> Done!"
