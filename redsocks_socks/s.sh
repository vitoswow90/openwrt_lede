#!/bin/bash
	clear
	echo ""
	echo "What do you want to do?"
	echo ""
	echo "		1) Stop VPN service " 
	echo "		2) Start VPN service "
	echo "		3) Change FIREWALL rules "
	echo "		4) Stop Redsocks and SSH-socks  "
	echo "		5) Start Redsocks and SSH-socks  "
	echo "		6) Stop Redsocks2  "
	echo "		7) Start Redsocks2  "
	echo "		8) Connect to SSH   "
	echo ""
	read -p "Select an option [1-8]: " option
	case $option in
		
		1) 
		echo "Working..."; sleep 1; /etc/init.d/openvpn stop; /etc/init.d/openvpn disable;echo "VPN DISABLED"
        exit
		;;
		2) 
		echo "Starting.."; sleep 1; /etc/init.d/openvpn enable; /etc/init.d/openvpn start; echo "VPN STARTED"
        exit
		;;
		3) 
		echo "Changing..."; sleep 1; bash /root/fire.sh; sleep 1; echo "                ready to GO !"
        exit
		;;
		4) 
		echo "Stop the REDSOCKS AND SOCKS..."; sleep 1; /etc/init.d/redsocks stop ; /etc/init.d/socks stop; echo "REDSOCKS AND SOCKS OFF!"
        exit
		;;
		5) 
		echo "Starting the REDSOCKS AND SOCKS..."; sleep 1; /etc/init.d/redsocks start ; /etc/init.d/socks start; echo "REDSOCKS AND SOCKS ON!"
        exit
		;;
		6) 
		echo "Stop the REDSOCKS2..."; sleep 1; /etc/init.d/redsocks2 stop ; echo "REDSOCKS2 OFF!"
		exit
        ;;
		7) 
		echo "Starting the REDSOCKS2..."; sleep 1; /etc/init.d/redsocks2 start ; echo "REDSOCKS2 STARTED!"
		exit
        ;;
		8)
		echo "  	Connecting to server ..... "; sleep 2; ssh root@162.243.17.80 -p 2222; echo "CONNECTED."
		exit
		;;
	esac