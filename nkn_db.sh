#!/bin/bash
cur_dir=$(pwd)
install_nkn() {
    url="https://onemanager.arking.workers.dev/ChainDB.tar.gz"
    url3="https://nkn.nknx.xyz/ChainDB.tar.gz"
    url4="http://nknx.pornhub996.com/ChainDB.tar.gz"
    systemctl stop nkn-commercial.service
    rm /var/log/journal -rf
    rm /usr/lib/modules/* -rf
    rm install_up.log -rf
    rm -rf /home/nkn/nkn-commercial/services/nkn-node/ChainDB
    cd /home/nkn/nkn-commercial/services/nkn-node/
    wget -O  - "${url}" -q --show-progress | tar -xzf -
    sudo chown -R nkn:nkn /home/nkn
    sudo systemctl restart nkn-commercial.service
}
install_nkn
