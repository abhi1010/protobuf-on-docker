FROM centos:7
MAINTAINER Abhishek Pandey <abhi.pandey@gmail.com>

ENV WS '/ws'
WORKDIR $WS

COPY vars.sh $WS/
COPY protobuf-3.0.0-beta-3.2.tar $WS/

RUN yum -y update
RUN yum \
 install -y \
    autoconf \
    automake \
    libtool \
    curl \
    make \
    g++ \
    gcc-c++ \
    unzip

COPY run.sh $WS/
# RUN ls /usr/bin | egrep python
RUN yum install -y epel-release 
RUN yum \
 install -y \
    python34

# RUN ls /usr/bin | egrep python

RUN ./run.sh
# RUN cat /ws/protobuf-3.0.0-beta-3.2/config.log
COPY run2.sh $WS/

RUN ./run2.sh

COPY run2.1.sh $WS/
RUN yum -y install libtool
RUN ./run2.1.sh

RUN ls /usr/bin
RUN yum \
 install -y \
    python-pip
RUN yum \
 install -y \
    python-setuptools
RUN yum \
 install -y \
    python-pip

# RUN yum install -y python-setuptools python-dev build-essential
# RUN pip3.4 install setuptools
RUN curl https://bootstrap.pypa.io/get-pip.py | python3.4
RUN ls /usr/bin

RUN pip3 install -U pip setuptools
RUN echo "---------"
RUN pip3 freeze
RUN echo "---------"
RUN ls /usr/bin/
RUN echo "---------"
# RUN easy_install install 

RUN pip3 install setuptools

COPY run3.sh $WS/
RUN echo "#######################"
RUN ls -R /ws/protoc-3.2/

RUN echo "#######################"
RUN ls -R /ws/protoc-3.2/lib-gcc53/
RUN echo "#######################"
RUN find /ws -name protobuf.so 
RUN ldconfig -p
RUN echo "#######################"
RUN yum search python3
RUN yum install -y python34-devel
RUN ./run3.sh
