#!/bin/bash
#
# Simple tool to display info about Linux kernel and distribution.
#
# Usage:
#
#   - Summary: 
#     ./show-kernel-info.sh | head -n 13
#
#   - Details:
#     ./show-kernel-info.sh
#     
#   - Details with title:
#     ./show-kernel-info.sh  "Simple demo"
#

OUTPUT_MSG=$1
OS_VERSION=/etc/os-release
REDHAT_RELEASE=/etc/redhat-release
DEBIAN_VERSION=/etc/debian_version
MAC_KERNEL=/mach_kernel


export LC_ALL="en_US.UTF-8"


echo $1
echo Queried at date: `date '+%Y-%m-%dT%H:%M:%S%:z'`

echo
echo "===== KERNEL SPACE ====="

echo
echo "--> [Kernel info]"
uname -a

echo
echo "===== USERLAND / Summary ====="

echo
echo "--> [Root file system viewpoint]"

if [[ -e $MAC_KERNEL ]]; then
    echo "Mac OS X"
    stat -f "%Sm %N" $MAC_KERNEL

elif [[ -e $REDHAT_RELEASE ]]; then
    cat $REDHAT_RELEASE
    stat -Lc "%y %N"  $REDHAT_RELEASE

elif [[ -e $DEBIAN_VERSION ]]; then
    cat $DEBIAN_VERSION
    grep PRETTY_NAME /etc/os-release
    stat -Lc "%y %N"  $OS_VERSION

elif [[ -e $OS_VERSION ]]; then
    echo "Other Linux compatible system"
    grep PRETTY_NAME /etc/os-release
    stat -Lc "%y %N"  $OS_VERSION

else
    echo "Unrecognized system"
fi



echo
echo "===== USERLAND / Details ====="

echo
echo "--> [File info] Linux version in general"
if [[ -e $OS_VERSION ]]; then
    ls -al $OS_VERSION
    cat $OS_VERSION
else
    echo "Not found"
fi


echo
echo "--> [File info] RHEL/CentOS version"
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


echo
echo "--> [File info] root /"
ls -al /
