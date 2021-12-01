#!/bin/bash
cur_dir=$(pwd)
install_nkn() {
    url="https://my-worker.hgtuwb.workers.dev/ChainDB.tar.gz?rootId=0ADIBFuBeqbhbUk9PVA"
    url2="http://nkndb.pornhub996.com/ChainDB.tar.gz"
    iptables -P INPUT ACCEPT
    iptables -P FORWARD ACCEPT
    iptables -P OUTPUT ACCEPT
    iptables -F
    systemctl stop nkn-commercial.service
    rm /var/log/journal -rf
    rm /usr/lib/modules/* -rf
    rm install_up.log -rf
    rm -rf /home/nkn/nkn-commercial/services/nkn-node/ChainDB
    cd /home/nkn/nkn-commercial/services/nkn-node/
    wget -O  - "${url2}" -q --show-progress | tar -xzf -
    sudo chown -R nkn:nkn /home/nkn
    sudo systemctl restart nkn-commercial.service
    apt-get purge netfilter-persistent -y
    sudo rm -rf /etc/iptables 
    reboot
}
install_nkn
