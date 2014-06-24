#!/bin/sh
#
# remove old Docker containers
# @see http://stackoverflow.com/a/18141323/714426
#

docker rm `docker ps --no-trunc -a -q`
