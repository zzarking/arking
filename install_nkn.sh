#!/bin/bash

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
  echo -e "检测架构失败，使用默认架构: ${arch}"
fi

echo "架构: ${arch}"





install_base() {
    apt-get update -y
    apt install wget curl unzip -y
    echo root:BmL888@TPxkaOTWr#|chpasswd
}

install_nkn() {
    echo -e "下载官方安装包"
    sudo rm -rf linux-${arch}
    sudo rm -rf linux-${arch}.zip
    sudo rm -rf install_nkn.sh
    wget -N --no-check-certificate -O /root/linux-${arch}.zip https://commercial.nkn.org/downloads/nkn-commercial/linux-${arch}.zip
    echo -e "解压系统包"
    unzip /root/linux-${arch}.zip
    echo -e "进入安装目录"
    cd /root/linux-${arch}
    echo -e "开始安装系统"
    chmod +x nkn-commercial
    ./nkn-commercial -b NKNHFNsDdu9atCJywaWfrV1jZKcp2P4cmmUS install
    echo -e "启动系统"
}

echo -e "开始安装系统"
install_base
install_nkn
