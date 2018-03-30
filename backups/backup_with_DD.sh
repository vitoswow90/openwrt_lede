#!/bin/bash
#
#
#
ssh root@192.168.10.1 "dd if=/dev/sda | gzip -1 -" | dd of=~/openwrt/openwrt_full.gz
sleep 10
echo "BACKUP DONE to ~/openwrt/openwrt_full.gz"
