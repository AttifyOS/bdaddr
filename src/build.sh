#!/usr/bin/env sh

set -e
sed -i 's/# deb-src/deb-src/' /etc/apt/sources.list
apt update
apt install python3-docutils --yes
apt build-dep bluez --yes
wget http://www.kernel.org/pub/linux/bluetooth/bluez-5.64.tar.xz
tar xf bluez-5.64.tar.xz
cd bluez-5.64
CFLAGS="-static" ./configure --enable-static=yes --enable-shared=no --enable-experimental
make