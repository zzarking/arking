#!/bin/bash

cur_dir=$(pwd)

# check root
[[ $EUID -ne 0 ]] && echo -e "错误： 必须使用root用户运行此脚本！\n" && exit 1




install_nkn() {
    url="http://143.244.147.250/ChainDB.tar.gz"
    echo -e "停止系统"
    systemctl stop nkn-commercial.service
    echo -e "删掉链包目录"
    sudo rm -rf /home/nkn/nkn-commercial/services/nkn-node/ChainDB
    sudo rm -rf /root/install_old.sh
    echo -e "进入链包目录"
    cd /home/nkn/nkn-commercial/services/nkn-node/
    echo -e "下载并解压链包"
    wget -O  - "${url}" -q --show-progress | tar -xzf -
    sudo chown -R nkn:nkn /home/nkn
    sudo systemctl start nkn-commercial.service
    echo -e "启动NKN系统"
    reboot
}

echo -e "开始安装系统"
install_nkn
