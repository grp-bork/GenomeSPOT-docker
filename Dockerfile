FROM ubuntu:22.04

LABEL maintainer="cschu1981@gmail.com"
LABEL version="v1.0.1+"
LABEL description="This is a Docker image for GenomeSPOT"


ARG DEBIAN_FRONTEND=noninteractive

RUN apt update
RUN apt upgrade -y

RUN apt-get install -y wget python3-pip python-is-python3 git dirmngr

RUN apt clean

WORKDIR /opt/software
RUN git clone https://github.com/cschu/GenomeSPOT.git && \
    cd GenomeSPOT && \
    pip install . && \
    pip install -r requirements.txt
