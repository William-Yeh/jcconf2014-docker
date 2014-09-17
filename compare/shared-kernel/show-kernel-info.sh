#!/bin/bash
#
# Simple tool to display info about Linux kernel and distribution.
#

OUTPUT_MSG=$1
OS_VERSION=/etc/os-release
REDHAT_RELEASE=/etc/redhat-release
DEBIAN_VERSION=/etc/debian_version


echo $1

echo
echo "--> [Date]"
date '+%Y-%m-%dT%H:%M:%S%:z'


echo
echo "--> [Kernel info]"
uname -a


echo
echo "--> [File info] Linux version in general"
if [[ -e $OS_VERSION ]]; then
    ls -al $OS_VERSION
    cat $OS_VERSION
else
    echo "Not found"
fi


echo
echo "--> [File info] CentOS version"
if [[ -e $REDHAT_RELEASE ]]; then
    ls -al $REDHAT_RELEASE
    cat $REDHAT_RELEASE
else
    echo "Not found."
fi


echo
echo "--> [File info] Debian/Ubuntu version"
if [[ -e $DEBIAN_VERSION ]]; then
    ls -al $DEBIAN_VERSION
    cat $DEBIAN_VERSION
else
    echo "Not found"
fi

