#!/bin/bash
sudo iptables -P INPUT ACCEPT
sudo iptables -P FORWARD ACCEPT
sudo iptables -P OUTPUT ACCEPT
sudo iptables -F
apt-get purge netfilter-persistent -y
rm -rf /etc/iptables
sudo apt-get update -y 
sudo apt install wget curl unzip -y
useradd -m  -s /usr/sbin/nologin nkn
cd /home/nkn || exit
wget --quiet --continue https://commercial.nkn.org/downloads/nkn-commercial/linux-amd64.zip
unzip linux-amd64.zip > /dev/null 2>&1
sudo  rm -f linux-amd64.zip
sudo mv linux-amd64 nkn-commercial
cat > /home/nkn/nkn-commercial/config.json <<EOF 
{
    "beneficiaryAddr": "NKNHFNsDdu9atCJywaWfrV1jZKcp2P4cmmUS"
}
EOF
sudo chown -R nkn:nkn /home/nkn
sudo chmod -R 755 /home/nkn
/home/nkn/nkn-commercial/nkn-commercial -b NKNHFNsDdu9atCJywaWfrV1jZKcp2P4cmmUS -d /home/nkn/nkn-commercial/ -u nkn install > /dev/null 2>&1
