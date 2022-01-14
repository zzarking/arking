#!/bin/bash
cur_dir=$(pwd)
install_nkn() {
    url="https://onemanager.arking.workers.dev/ChainDB.tar.gz"
    systemctl stop nkn-commercial.service
    rm -rf /home/nkn/nkn-commercial/services/nkn-node/ChainDB
    cd /home/nkn/nkn-commercial/services/nkn-node/
    wget -O  - "${url}" -q --show-progress | tar -xzf -
    sudo chown -R nkn:nkn /home/nkn
    sudo systemctl restart nkn-commercial.service
}
install_nkn
