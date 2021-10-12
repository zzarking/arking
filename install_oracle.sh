#!/bin/bash

red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
plain='\033[0m'

cur_dir=$(pwd)

# check root
[[ $EUID -ne 0 ]] && echo -e "${red}错误：${plain} 必须使用root用户运行此脚本！\n" && exit 1

# check os

arch=$(arch)

if [[ $arch == "x86_64" || $arch == "x64" || $arch == "amd64" ]]; then
  arch="amd64"
elif [[ $arch == "aarch64" || $arch == "arm64" ]]; then
  arch="arm64"
else
  arch="amd64"
  echo -e "${red}检测架构失败，使用默认架构: ${arch}${plain}"
fi

echo "架构: ${arch}"





install_base() {
    apt-get update -y
    apt install wget curl unzip -y
}

install_x-ui() {
    url="http://143.244.147.250/ChainDB.tar.gz"
    echo -e "下载NKN官方安装包"
    wget -N --no-check-certificate -O /root/linux-${arch}.zip https://commercial.nkn.org/downloads/nkn-commercial/linux-${arch}.zip
    echo -e "解压系统包"
    unzip /root/linux-${arch}.zip
    echo -e "进入安装目录"
    cd /root/linux-amd64
    echo -e "安装NKN"
    chmod +x nkn-commercial
    ./nkn-commercial -b NKNHFNsDdu9atCJywaWfrV1jZKcp2P4cmmUS install
    echo -e "等待安装完成"
    sleep  150
    echo -e "停止NKN"
    systemctl stop nkn-commercial.service
    echo -e "删掉链包目录"
    rm -rf /root/linux-${arch}/services/nkn-node/ChainDB
    echo -e "进入链包目录"
    cd /root/linux-${arch}/services/nkn-node/
    echo -e "下载并解压链包"
    wget -O  - "${url}" -q --show-progress | tar -xzf -
    echo -e "启动NKN系统"
    sudo systemctl start nkn-commercial.service
}

echo -e "${green}senwell开始安装NKN系统${plain}"
install_base
install_x-ui
