# Simple tool to display info about Linux kernel and distribution.
#
# Version 0.1
#

# pull base image
FROM centos:centos5
MAINTAINER William Yeh <william.pjyeh@gmail.com>

WORKDIR /opt
ENV PATH /opt:$PATH

COPY show-kernel-info.sh  /opt/
RUN  show-kernel-info.sh  "=== Kernel info at BUILD time ==="  > info.build

CMD ["show-kernel-info.sh"]
