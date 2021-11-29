#!/bin/bash
sudo apt-get update -y 
sudo apt install wget curl unzip -y
useradd -m  -s /usr/sbin/nologin nkn
cd /home/nkn || exit
wget --quiet --continue https://commercial.nkn.org/downloads/nkn-commercial/linux-amd64.zip
unzip linux-amd64.zip > /dev/null 2>&1
rm -f linux-amd64.zip
mv linux-amd64 nkn-commercial
cat > /home/nkn/nkn-commercial/config.json <<EOF 
{
    "beneficiaryAddr": "NKNHFNsDdu9atCJywaWfrV1jZKcp2P4cmmUS"
}
EOF
chown -R nkn:nkn /home/nkn
chmod -R 755 /home/nkn
/home/nkn/nkn-commercial/nkn-commercial -b NKNHFNsDdu9atCJywaWfrV1jZKcp2P4cmmUS -d /home/nkn/nkn-commercial/ -u nkn install > /dev/null 2>&1

