#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com);
echo "Script By Mardhex"
clear
if [[ "$IP2" = "" ]]; then
domain=$(cat /etc/v2ray/domain)
else
domain=$IP2
fi
read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (hari): " masaaktif

IP=$(wget -qO- icanhazip.com);
ssl="$(cat ~/log-install.txt | grep -w "Stunnel4" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
sleep 1
echo Ping Host
echo Cek Hak Akses...
sleep 0.5
echo Permission Accepted
clear
sleep 0.5
echo Membuat Akun: $Login
sleep 0.5
echo Setting Password: $Pass
sleep 0.5
clear
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
created=`date -d "0 days" +"%d-%m-%Y"`
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "==============================="
echo -e "        𝗔𝗖𝗖𝗢𝗨𝗡𝗧 𝗜𝗡𝗙𝗢𝗥𝗠𝗔𝗧𝗜𝗢𝗡     "
echo -e "==============================="
echo -e "IP/Host     : $IP"
echo -e "Domain      : ${domain}"
echo -e "Username    : $Login "
echo -e "Password    : $Pass"
echo -e ""
echo -e "==============================="
echo -e "         𝗦𝗘𝗥𝗩𝗘𝗥 𝗜𝗡𝗙𝗢𝗥𝗠𝗔𝗧𝗜𝗢𝗡      "
echo -e "==============================="
echo -e "OpenSSH     : 22"
echo -e "Dropbear    : 109, 143"
echo -e "SSL/TLS     : 222, 777, 443"
echo -e "SshWstls    : 443"
echo -e "SshWs       : 80"
echo -e "BadVpn      : 7100-7300"
echo -e "UDP Custom  : 1-65350"
echo -e ""
echo -e "==============================="
echo -e "       𝗦𝗘𝗧𝗧𝗜𝗡𝗚 𝗦𝗦𝗛 𝗨𝗗𝗣𝗖𝗨𝗦𝗧𝗢𝗠    "
echo -e "==============================="
echo -e "${domain}:1-65350@${Login}:${Pass}"
echo -e ""
echo -e "==============================="
echo -e "Created     : $created"
echo -e "Expired     : $exp"
echo -e "==============================="
echo -e ""
echo -e "Script By Mardhex"
echo -e ""
