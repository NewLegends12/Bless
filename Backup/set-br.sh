#!/bin/bash
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
# Link Hosting Kalian
mdxvpn="raw.githubusercontent.com/Exe303/Bless/main/Backup"
apt install rclone -y
printf "q\n" | rclone config
wget -O /root/.config/rclone/rclone.conf "https://${mdxvpn}/rclone.conf"
git clone  https://github.com/magnific0/wondershaper.git
cd wondershaper
make install
cd
rm -rf wondershaper
echo > /home/limit
apt install msmtp-mta ca-certificates bsd-mailx -y
cat<<EOF>>/etc/msmtprc
defaults
tls on
tls_starttls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt
account default
host smtp.gmail.com
port 587
auth on
user wongloran01@gmail.com
from wongloran01@gmail.com
password obtljegbomwyzizg 
logfile ~/.msmtp.log
EOF
chown -R www-data:www-data /etc/msmtprc
cd /usr/bin
wget -O autobackup "https://${mdxvpn}/autobackup.sh"
wget -O backup "https://${mdxvpn}/backup.sh"
wget -O restore "https://${mdxvpn}/restore.sh"
wget -O bckp "https://${mdxvpn}/bckp.sh"
wget -O autoreboot "https://${mdxvpn}/autoreboot.sh"
chmod +x autobackup
chmod +x backup
chmod +x restore
chmod +x autoreboot
cd
rm -f /root/set-br.sh
