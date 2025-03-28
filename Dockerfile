FROM ubuntu:24.04

LABEL Description="Astra Ubuntu Development Environment"
LABEL version="1.0"

ENV HOME /home/syna
RUN groupadd -g 1001 syna \
    && useradd -d $HOME -u 1001 -g 1001 -m syna -s /bin/bash

ADD /usr/share/synap /usr/share/synap
ADD /usr/bin/synap_* /usr/bin/
ADD /usr/lib/libsynapnb.so /usr/lib/
ADD /usr/lib/libtensorflow-lite.so /usr/lib/

RUN apt-get update \
        && apt install -y build-essential python3 python3-pip python3-dev git cmake sudo ninja-build vim \
        curl nano 

RUN useradd -m -s /bin/bash myuser && \
        echo "syna ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER syna

WORKDIR $HOME
