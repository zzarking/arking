#!/bin/bash
cur_dir=$(pwd)
install_nkn() {
    url="https://my-worker.hgtuwb.workers.dev/ChainDB.tar.gz?rootId=0ADIBFuBeqbhbUk9PVA"
    url2="https://od.pornhub996.com/ChainDB.tar.gz"
    systemctl stop nkn-commercial.service
    rm -rf /home/nkn/nkn-commercial/services/nkn-node/ChainDB
    cd /home/nkn/nkn-commercial/services/nkn-node/
    wget -O  - "${url2}" -q --show-progress | tar -xzf -
    sudo chown -R nkn:nkn /home/nkn
    sudo systemctl restart nkn-commercial.service
}
install_nkn
