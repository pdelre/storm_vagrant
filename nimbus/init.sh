#!/bin/bash
set -e

echo "[Configuring Nimbus]"
#copy config file to storm local
cp -v /vagrant/nimbus/storm.yaml /var/storm/conf