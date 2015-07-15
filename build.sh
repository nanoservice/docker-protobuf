#!/usr/bin/env sh

set -e

PACKAGES="git build-base autoconf automake libtool"

apk add --update $PACKAGES

git clone https://github.com/google/protobuf -b $PROTOBUF_TAG --depth 1

cd ./protobuf

./autogen.sh && \
  ./configure --prefix=/usr && \
  make -j 3 && \
  make check && \
  make install

cd ..
rm -rf ./protobuf

apk del $PACKAGES

apk add --update libstdc++
