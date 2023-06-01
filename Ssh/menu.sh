#!/bin/bash

clear

if [[ -e /etc/debian_version ]]; then
	OS=debian
	RCLOCAL='/etc/rc.local'
elif [[ -e /etc/centos-release || -e /etc/redhat-release ]]; then
	OS=centos
	RCLOCAL='/etc/rc.d/rc.local'
	chmod +x /etc/rc.d/rc.local
else
	echo "It looks like you are not running this installer on Debian, Ubuntu or Centos system"
	exit
fi
color3='\e[031;1m'
color2='\e[34;1m'
color3='\e[0m'
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
IPVPS=$(curl -s ipv4.icanhazip.com )
	echo "--------------- Welcome To Premium Script Menu ---------------"
	echo "------------------------ Moddified By Mardhex -----------------------"
	echo " "
	cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
	cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
	freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
	tram=$( free -m | awk 'NR==2 {print $2}' )
	swap=$( free -m | awk 'NR==4 {print $2}' )
	up=$(uptime|awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')

	echo -e "\e[032;1mCPU Model:\e[0m $cname"
	echo -e "\e[032;1mNumber Of Cores:\e[0m $cores"
	echo -e "\e[032;1mCPU Frequency:\e[0m $freq MHz"
	echo -e "\e[032;1mTotal Amount Of RAM:\e[0m $tram MB"
	echo -e "\e[032;1mTotal Amount Of Swap:\e[0m $swap MB"
	echo -e "\e[032;1mSystem Uptime:\e[0m $up"
	echo -e "\e[032;1mIsp Name:\e[0m $ISP"
	echo -e "\e[032;1mCity:\e[0m $CITY"
	echo -e "\e[032;1mTime:\e[0m $WKT"
	echo -e "\e[033;1mIPVPS:\e[0m $IPVPS"
	date | lolcat
	echo -e "-----------------------------------------------------"

echo -e ""

echo -e "==========★✮  🎀  𝑀𝑒𝓃𝓊 𝒰𝓉𝒶𝓂𝒶  🎀  ✮★============"

echo -e " 1.  Control Panel SSH"

echo -e " 2.  Control Panel V2ray"

echo -e " 3.  Control Panel Slowdns"

echo -e " 4.  Add Subdomain"

echo -e " 5.  Auto Reboot Vps"

echo -e " 6.  Autobackup Data VPS"

echo -e " 7.  Backup Data VPS"

echo -e " 8.  Restore Data VPS"

echo -e " 9.  Reboot VPS"

echo -e "\e[32m══════════════════════════════════════════\e[m"

echo -e " x.   Keluar Dari Vps + Juice Ssh"

echo -e "\e[32m══════════════════════════════════════════\e[m"

echo -e ""

read -p "     Silakn Pilih Nomor Mulai  [1-9 or x] :  "  num

echo -e ""

case $num in

1)

tessh

;;

2)

addws

;;

3)

slowdns

;;

4)

addhost

;;

5)

autoreboot

;;

6)

autobackup

;;

7)

backup

;;

8)

restore


;;

9)

reboot

;;

x)

exit

;;

*)

echo "Silakan Pilih Kembali Yang Benar"

;;

esac
