#!/bin/bash
#
# Enter a running Docker container without SSH.
#
# @see http://jpetazzo.github.io/2014/03/23/lxc-attach-nsinit-nsenter-docker-0-9/
# @see http://www.colliernotes.com/2014/03/how-to-enter-docker-container-without.html
#
# ----
# NOTE for boot2docker user:
#   1. use `boot2docker ssh` to login to the host OS.
#   2. install `nsenter` on your own.  (Orz...)
#   3. run this script.
#
#   @see https://github.com/boot2docker/boot2docker/issues/374
# ----
#


readonly ARG_COUNT=$#
readonly CONTAINER_NAME=$1
readonly CMD=${2:-/bin/bash}



function main() {
    check_cmdline_args

    local pid=`sudo docker inspect --format '{{ .State.Pid }}' $CONTAINER_NAME`
    sudo nsenter --mount --uts --net --ipc --pid  --target $pid  $CMD
}


function check_cmdline_args() {

    if [ $ARG_COUNT -lt 1 ]; then
        cat << USAGE
Enter a running Docker container without SSH.
Usage: $0  container-name-or-id  [cmd]
Arguments:
  - container-name-or-id    use 'docker ps' to find it.
  - cmd                     command to be executed; '/bin/bash' by default.

USAGE

        exit 1
    fi
}


main "$@"
