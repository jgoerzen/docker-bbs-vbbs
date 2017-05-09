#!/bin/bash

set -e
set -x

# Download
cd /tmp/setup
wget http://software.bbsdocumentary.com/IBM/DOS/VBBS/vbbs614a.zip
wget http://www.filegate.net/comm/vbbsdocs.zip

sha256sum -c < sums

cd /dos/drive_g
mkdir vbbsinst
cd vbbsinst
unzip /tmp/setup/vbbs614a.zip
rm /tmp/setup/vbbs614a.zip

cd /dos/drive_g
mkdir vbbsdocs
cd vbbsdocs
unzip /tmp/setup/vbbsdocs.zip
rm /tmp/setup/vbbsdocs.zip

# Now we transform this into a running system.
cd /dos/drive_g/vbbsinst
apt-get update
apt-get -y --no-install-recommends install git
git init
git config --global user.email 'docker@example.com'
git add .
git commit -am 'Adding unpacked VBBS'
git apply /tmp/setup/transform-patch
rm /tmp/setup/transform-patch
rm -rf .git
cd ..
mv vbbsinst VBBS
dpkg --purge git
apt-get -y --purge autoremove
apt-get clean
rm -rf /var/lib/apt/lists/*
rm /root/.gitconfig


cd /dos

echo 2 > /dos/numnodes   # 2 nodes by default

echo "devicehigh=d:\\bin\\nansi.sys" >> /etc/dosemu/freedos/config.sys
