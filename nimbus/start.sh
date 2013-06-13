#!/bin/bash
set -e

echo "[Starting Nimbus]"
/var/storm/bin/storm nimbus &

echo "[Starting UI]"
/var/storm/bin/storm ui &