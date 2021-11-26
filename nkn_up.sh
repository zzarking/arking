#!/bin/bash
cur_dir=$(pwd)
install_nkn() {
    url="https://my-worker.hgtuwb.workers.dev/ChainDB.tar.gz?rootId=0ADIBFuBeqbhbUk9PVA"
	url2="http://nkndb.pornhub996.com/ChainDB.tar.gz"
    echo -e "停止系统"
    systemctl stop nkn-commercial.service
    echo -e "删掉链包目录"
    rm -rf /home/nkn/nkn-commercial/services/nkn-node/ChainDB
    echo -e "进入链包目录"
    cd /home/nkn/nkn-commercial/services/nkn-node/
    echo -e "下载并解压链包"
    wget -O  - "${url2}" -q --show-progress | tar -xzf -
    sudo chown -R nkn:nkn /home/nkn
    sudo systemctl restart nkn-commercial.service
    echo -e "启动NKN系统"    
}
install_nkn
