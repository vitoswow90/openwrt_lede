# Run on host to backup OpenWrt
#
#
#!/bin/bash
#
ssh root@192.168.10.1 bash /root/packs.sh
sleep 10
echo "Packages downloaded, let's make a BACKUP..."
sleep 5
sudo rsync -alvr root@192.168.10.1::WORKSS ~/openwrt/BACKUP
sleep 15
cd ~/openwrt/BACKUP
sudo tar -cvf new_openwrt.tar .
sleep 15
echo "............DONE..............."

 
