#!/bin/bash
apt update
DEBIAN_FRONTEND=nointeractive apt install -y nfs-server
mkdir /nfs-shared
echo "/nfs-shared 10.0.2.0/24(rw,sync)" >> /etc/exports
systemctl restart nfs-server
systemctl enable nfs-server
apt install -y amazon-ec2-utils
ec2-metadata -o | cut -d ' ' -f 2 > /nfs-shared/list.txt
chmod -R 777 /nfs-shared/
