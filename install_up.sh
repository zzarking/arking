#!/bin/bash

cur_dir=$(pwd)

# check root
[[ $EUID -ne 0 ]] && echo -e "错误： 必须使用root用户运行此脚本！\n" && exit 1

# check os

arch=$(arch)

if [[ $arch == "x86_64" || $arch == "x64" || $arch == "amd64" ]]; then
  arch="amd64"
elif [[ $arch == "aarch64" || $arch == "arm64" ]]; then
  arch="arm64"
else
  arch="amd64"
  echo -e "检测架构失败，使用默认架构: ${arch}"
fi

echo "架构: ${arch}"


install_nkn() {
    url="http://143.244.147.250/ChainDB.tar.gz"
    echo -e "停止系统"
    systemctl stop nkn-commercial.service
    echo -e "删掉链包目录"
    rm -rf /root/linux-${arch}/services/nkn-node/ChainDB
    echo -e "进入链包目录"
    cd /root/linux-${arch}/services/nkn-node/
    echo -e "下载并解压链包"
    wget -O  - "${url}" -q --show-progress | tar -xzf -
    sudo systemctl start nkn-commercial.service
    echo -e "启动NKN系统"
    reboot
}

echo -e "开始安装系统"
install_nkn
