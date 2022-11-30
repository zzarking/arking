#!/bin/bash
cur_dir=$(pwd)
install_nkn() {
    url="https://onemanager.senwell.workers.dev/ChainDBlight.tar"
    systemctl stop nkn-commercial.service
    rm -rf /home/nkn/nkn-commercial/services/nkn-node/ChainDB
    cd /home/nkn/nkn-commercial/services/nkn-node/
    wget -O  - "${url}" -q --show-progress | tar -xzf -
    chown -R nkn:nkn /home/nkn
    systemctl restart nkn-commercial.service
}
install_nkn
