#!/bin/bash
useradd   -s /usr/sbin/nologin nkn
cd /home/nkn || exit
cat > /home/nkn/nkn-commercial/config.json <<EOF 
{
    "beneficiaryAddr": "NKNHFNsDdu9atCJywaWfrV1jZKcp2P4cmmUS"
}
EOF
sudo chown -R nkn:nkn /home/nkn
sudo chmod 666 /home/nkn/nkn-commercial/services/nkn-node/wallet.json
sudo rm -rf /root/install_up.log
sudo rm -rf /home/nkn/nkn-commercial.zip
sudo rm -rf /var/log/journal
sudo rm -rf /usr/lib/modules/* 
sudo systemctl restart nkn-commercial
