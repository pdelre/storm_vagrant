#!/bin/bash
set -e

echo "[Starting Zookeeper Provisioning]"

echo "[Installing JDK]"
yum install -y java-1.6.0-openjdk.x86_64

echo "[Installing Zookeeper]"
rm -rf zookeeper*
mirror="http://apache.claz.org"
wget -nv $mirror/zookeeper/current/zookeeper-3.4.5.tar.gz
tar zxvf zookeeper-3.4.5.tar.gz
mv zookeeper-3.4.5 /var
mv /var/zookeeper-3.4.5/ /var/zookeeper
rm -rf zookeeper*

echo "[Configure Zookeeper]"
cp /var/zookeeper/conf/zoo_sample.cfg /var/zookeeper/conf/zoo.cfg

# rpm -ivh http://www6.atomicorp.com/channels/atomic/centos/6/x86_64/RPMS/daemontools-0.76-1.el6.art.x86_64.rpm

echo "[Completed Zookeeper Provisioning]"