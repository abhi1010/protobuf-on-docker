FROM fedora:23
MAINTAINER Abhishek Pandey <abhi.pandey@gmail.com>

ENV WS '/ws'
WORKDIR $WS

COPY vars.sh $WS/
COPY protobuf-3.0.0-beta-3.2.tar $WS/

# RUN dnf update
RUN dnf \
 install -y \
    autoconf \
    automake \
    libtool \
    curl \
    make \
    gcc-c++ \
    unzip

COPY run.sh $WS/




RUN dnf install -y which.x86_64
# RUN which python
RUN ls /usr/bin | egrep python
RUN dnf \
 install -y \
    python3

RUN ./run.sh

COPY run2.sh $WS/

RUN ./run2.sh


RUN dnf \
 install -y \
    python3-pip
RUN dnf \
 install -y \
    python3-setuptools
RUN dnf \
 install -y \
    python3-pip

# RUN dnf install -y python-setuptools python-dev build-essential
# RUN pip3.4 install setuptools

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
RUN dnf install -y redhat-rpm-config
RUN dnf search python3-devel
RUN dnf install -y python3-devel
RUN ./run3.sh
