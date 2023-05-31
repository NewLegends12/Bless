#!/bin/bash
#Script By Mardhex
read -p "Masukan Domain Baru Anda : " domainbaru

#Validate
if [[ $domainbaru == "" ]]; then
echo "Masukan Ulang Domain Anda"
exit 1
fi

#Input To Domain
cat > /etc/v2ray/domain << END
$domainbaru
END

clear 
echo "Sukses Mengganti Domain Baru"
echo ""
echo "Silakan Reboot Vps Anda"