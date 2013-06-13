#!/bin/bash
set -e

echo "[Configuring Supervisor]"
#copy config file to storm local
cp -v /vagrant/supervisor/storm.yaml /var/storm/conf