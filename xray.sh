#!/bin/bash
#Script By Mardhex
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ipinfo.io/ip);
mkdir /var/lib/premium-script;
echo "IP=" >> /var/lib/premium-script/ipvps.conf
#install ssh ovpn
wget https://raw.githubusercontent.com/Exe303/Bless/main/Ssh/ssh-vpn.sh && chmod +x ssh-vpn.sh && screen -S ssh-vpn ./ssh-vpn.sh
#Install Script Add Domain
wget https://raw.githubusercontent.com/Exe303/Bless/main/Xray/m-xray.sh && chmod +x m-xray.sh && ./m-xray.sh
#Install Auto Backup
wget https://raw.githubusercontent.com/Exe303/Bless/main/Backup/set-br.sh && chmod +x set-br.sh && ./set-br.sh
rm -f /root/ssh-vpn.sh
rm -f /root/m-xray.sh
rm -f /root/set-br.sh
cat <<EOF> /etc/systemd/system/autosett.service
[Unit]
Description=autosetting
Documentation=https://mdxcloud.net

[Service]
Type=oneshot
ExecStart=/bin/bash /etc/set.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable autosett
wget -O /etc/set.sh "https://raw.githubusercontent.com/Exe303/Bless/main/Ssh/set.sh"
chmod +x /etc/set.sh
history -c
echo "1.2" > /home/ver
clear
echo " "
echo " Auto Installer Sukses Terinstall "
echo " "
echo "==========A̳U̳T̳O̳ ̳S̳C̳R̳I̳P̳T̳ ̳B̳Y̳ ̳M̳D̳X̳T̳U̳N̳N̳E̳L̳=========" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "    [INFORMASI Shadowsocks-R & Shadowsocks]"  | tee -a log-install.txt
echo "    ---------------------------------------" | tee -a log-install.txt
echo "   - Websocket Shadowsocks   : 443"  | tee -a log-install.txt
echo "   - Shadowsocks GRPC        : 443"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "    [INFORMASI XRAY]"  | tee -a log-install.txt
echo "    ---------------------------------------" | tee -a log-install.txt
echo "   - Xray Vmess Ws Tls       : 443"  | tee -a log-install.txt
echo "   - Xray Vless Ws Tls       : 443"  | tee -a log-install.txt
echo "   - Xray Vmess Ws None Tls  : 80"  | tee -a log-install.txt
echo "   - Xray Vless Ws None Tls  : 80"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "    [INFORMASI TROJAN]"  | tee -a log-install.txt
echo "    ---------------------------------------" | tee -a log-install.txt
echo "   - Websocket Trojan        : 443"  | tee -a log-install.txt
echo "   - Trojan GRPC             : 443"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "======================[SCRIPT PREMIUM BY MARDHEX]====================="
echo ""
echo " Server Reboot 10 detik"
sleep 10
rm -f xray.sh
reboot