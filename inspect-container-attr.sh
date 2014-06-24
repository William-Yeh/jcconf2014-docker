#!/bin/bash
#
# inspect the attribute (e.g., IP address, pid) of a running Docker container.
#

readonly ARG_COUNT=$#
readonly ATTR=$1
readonly CONTAINER_NAME=$2



function main() {
    check_cmdline_args


    case "$ATTR" in
    ip)   #echo "Finding IP address"
        docker inspect --format '{{ .NetworkSettings.IPAddress }}' $CONTAINER_NAME
        #docker inspect $CONTAINER_NAME | grep IPAddress | cut -d '"' -f 4
        ;;

    pid)  #echo  "Finding PID"
        docker inspect --format '{{ .State.Pid }}' $CONTAINER_NAME
        ;;
    esac

}


function check_cmdline_args() {

    if [ $ARG_COUNT -lt 2 ]; then
        cat << USAGE
Inspect the attribure (e.g., IP address, pid) of a running Docker container.
Usage: $0  attribute  container-name-or-id
Arguments:
  - attribute               'ip' or 'pid'
  - container-name-or-id    use 'docker ps' to find it.

USAGE

        exit 1
    fi
}


main "$@"
