#!/bin/bash

PACKS="$(opkg list-installed)"
PACKS_NAMES="$(echo -ne "$PACKS" | awk '{ printf "%s ", $1 }')"
#echo -ne "$PACKS" | awk '{ printf "pack: %s from: %s to: %s \n", $1, $3, $5 }'
PACKS_COUNT="$(echo "$PACKS" | wc -l)"
sleep 5
mkdir -p /root/packs
sleep 1
echo $PACKS_NAMES >> /root/packs/packs.txt
sleep 2
cd /root/packs
opkg download $PACKS_NAMES
sleep 2
echo "$PACKS_COUNT .......... PACKS downloaded...."

