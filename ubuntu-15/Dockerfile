FROM ubuntu:15.10
MAINTAINER Abhishek Pandey <abhishek@tilde.sg>

ENV WS '/ws'
WORKDIR $WS

COPY vars.sh $WS/
COPY protobuf-3.0.0-beta-3.2.tar $WS/

RUN apt-get update
RUN apt-get \
 install --force-yes -y \
    autoconf \
    automake \
    libtool \
    curl \
    make \
    g++ \
    unzip

COPY run.sh $WS/

RUN apt-get \
 install --force-yes -y \
    python3.4

RUN ./run.sh

COPY run2.sh $WS/

RUN ./run2.sh


RUN apt-get \
 install --force-yes -y \
    python3-pip
RUN apt-get \
 install --force-yes -y \
    python3-setuptools
RUN apt-get \
 install --force-yes -y \
    python3-pip

# RUN apt-get install --force-yes -y python-setuptools python-dev build-essential
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
RUN ./run3.sh
