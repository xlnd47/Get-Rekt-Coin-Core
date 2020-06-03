FROM debian:stretch
LABEL maintainer="GetRektCoin Developers <dev@getrektcoin.org>"
LABEL description="Dockerised GetRektCoinCore, built from Travis"

RUN apt-get update && apt-get -y upgrade && apt-get clean && rm -fr /var/cache/apt/*

COPY bin/* /usr/bin/
