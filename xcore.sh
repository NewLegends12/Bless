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
#Install slowdns
wget https://raw.githubusercontent.com/leitura/slowdns/main/install; chmod +x install; ./install
#Install Script Add Domain
wget https://raw.githubusercontent.com/Exe303/Bless/main/Tunnel/acelltun.sh && chmod +x acelltun.sh && screen -S v2ray ./acelltun.sh
#Install Script SshUdp
wget https://raw.githubusercontent.com/Exe303/Bless/main/Tunnel/udp.sh && bash udp.sh
#Install Script AutoBackup
wget https://raw.githubusercontent.com/Exe303/Bless/main/Backup/set-br.sh && chmod +x set-br.sh && ./set-br.sh
rm -f /root/ssh-vpn.sh
rm -f /root/install
rm -f /root/acelltun.sh
rm -f /root/udp.sh
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
echo "" | tee -a log-install.txt
echo "--------------------------------------------------------------------------------" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                 : 22"  | tee -a log-install.txt
echo "   - Stunnel4                : 222, 777, 443"  | tee -a log-install.txt
echo "   - Ssh Wstls               : 443"  | tee -a log-install.txt
echo "   - Ssh Ws                  : 80"  | tee -a log-install.txt
echo "   - Dropbear                : 109, 143"  | tee -a log-install.txt
echo "   - Ssh Udp                 : 1-65250"  | tee -a log-install.txt
echo "   - Badvpn                  : 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx                   : 81"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   - Dev/Main                : KANG MARDHEX"  | tee -a log-install.txt
echo "   - Telegram                : t.me/mdxdev"  | tee -a log-install.txt
echo "   - Instagram               : *"  | tee -a log-install.txt
echo "   - Whatsapp                : *"  | tee -a log-install.txt
echo "   - Facebook                : *"  | tee -a log-install.txt
echo "------------------A̳U̳T̳O̳ ̳S̳C̳R̳I̳P̳T̳ ̳B̳Y̳ ̳M̳D̳X̳T̳U̳N̳N̳E̳L̳-----------------" | tee -a log-install.txt
echo ""
echo " Server Reboot 5 detik"
sleep 5
rm -f xcore.sh
reboot
