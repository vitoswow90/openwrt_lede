#!/bin/bash
cd /etc
mv firewall.user firewall.userold
rm -f firewall.user
mv /root/firewall.user firewall.user
rm -f /root/firewall.user
mv firewall.userold /root/firewall.user
rm -f firewall.userold
cd /root
echo Change firewall files - done
echo Restarting ...
sleep 5
/etc/init.d/firewall restart
echo ... done
#echo Reloading...
#sleep 5
#/etc/init.d/firewall reload
#echo ... done
sleep 3
echo "Let me show you /etc/firewall.user config now"
sleep 5
cat /etc/firewall.user