#!/bin/bash

set -e
set -x

# Download
cd /tmp/setup
wget http://software.bbsdocumentary.com/IBM/DOS/VBBS/vbbs614a.zip

sha256sum -c < sums

cd /dos/drive_g
mkdir vbbsinst
cd vbbsinst
unzip /tmp/setup/vbbs614a.zip
rm /tmp/setup/vbbs614a.zip

cd /dos

echo 2 > /dos/numnodes   # 2 nodes by default


