#!/bin/bash

# Build an Astra Development Docker Container

mkdir -p usr/share usr/bin usr/lib
cp -rv /usr/share/synap usr/share
cp -v /usr/bin/synap_* usr/bin
cp -v /usr/lib/libtensorflow-lite.so usr/lib
cp -v /usr/lib/libsynapnb.so usr/lib

docker build --network=host -t astra_dev .
