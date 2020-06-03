#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/..

DOCKER_IMAGE=${DOCKER_IMAGE:-getrektcoinpay/getrektcoind-develop}
DOCKER_TAG=${DOCKER_TAG:-latest}

BUILD_DIR=${BUILD_DIR:-.}

rm docker/bin/*
mkdir docker/bin
cp $BUILD_DIR/src/getrektcoind docker/bin/
cp $BUILD_DIR/src/getrektcoin-cli docker/bin/
cp $BUILD_DIR/src/getrektcoin-tx docker/bin/
strip docker/bin/getrektcoind
strip docker/bin/getrektcoin-cli
strip docker/bin/getrektcoin-tx

docker build --pull -t $DOCKER_IMAGE:$DOCKER_TAG -f docker/Dockerfile docker
