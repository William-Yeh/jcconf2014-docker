#!/bin/bash
#
# Show the service startup time for each case.
#

echo "==> Showing the startup time of Redis server in 3 cases."
echo
echo

echo "==> Native case"
sudo time -p -v service redis-server start


echo
echo
echo "==> Docker case"
sudo time -p -v docker run -d  --name redis  williamyeh/redis  start


echo
echo
echo "==> VM case"
time -p -v vagrant up redis2


