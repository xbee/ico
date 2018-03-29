FROM ubuntu:16.04

LABEL maintainer="olevzon@gmail.com"


ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN apt-get update -y && \
    apt install -y git build-essential libssl-dev python3 python3-venv python3-setuptools python3-dev cmake libboost-all-dev git wget vim zip traceroute netcat procps inetutils-ping && \
    apt-get install -y python3-pip libz3-dev && \
    pip3 install wheel && \
    apt install -y software-properties-common && \
    add-apt-repository -y ppa:ethereum/ethereum && \
    apt update -y && \
    apt install -y ethereum 



#0.17 build
RUN wget https://github.com/ethereum/solidity/releases/download/v0.4.18/solidity-ubuntu-trusty.zip && \
    unzip solidity-ubuntu-trusty.zip && \
    cp solc /bin/


RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

#RUN cd /usr/src/app

COPY . .

RUN pip3 install --no-cache-dir -r requirements.txt

RUN pip3 install -e .