#!/bin/bash
set -e

echo "[Starting Storm Provisioning]"

echo "[Installing Prereqs]"
cd ~
yum install -y libuuid-devel git libtool java-1.6.0-openjdk-devel python unzip
export JAVA_HOME=/usr/lib/jvm/java/

echo "[Installing ZeroMQ]"
rm -rf zeromq*
wget -nv http://download.zeromq.org/zeromq-2.1.7.tar.gz
tar -xzvf zeromq-2.1.7.tar.gz
cd zeromq-2.1.7
./configure
make
make install
cd ~
rm -rvf zeromq*

echo "[Installing JZMQ]"
rm -rf jzmq*
git clone https://github.com/nathanmarz/jzmq.git
cd jzmq
./autogen.sh
./configure
make
make install
cd ~
rm -rvf jzmq*

echo "[Installing Storm]"
rm -rf storm*
wget -nv https://dl.dropbox.com/u/133901206/storm-0.8.2.zip
unzip storm-0.8.2.zip
mv storm-0.8.2 /var/
mv /var/storm-0.8.2 /var/storm
rm -rvf storm*
mkdir /var/storm-local

echo "[Completed Storm Provisioning]"