#!/bin/bash

cur_dir=$(pwd)

# check root
[[ $EUID -ne 0 ]] && echo -e "${red}错误：${plain} 必须使用root用户运行此脚本！\n" && exit 1

# check os

arch=$(arch)

if [[ $arch == "x86_64" || $arch == "x64" || $arch == "amd64" ]]; then
  arch="gost-linux-amd64-2.11.1"
elif [[ $arch == "aarch64" || $arch == "arm64" ]]; then
  arch="gost-linux-armv5-2.11.1"
else
  arch="amd64"
  echo -e "检测架构失败，使用默认架构: ${arch}"
fi

echo "架构: ${arch}"

wget -N --no-check-certificate https://github.com/ginuerzh/gost/releases/download/v2.11.1/${arch}.gz && gzip -d ${arch}.gz
mv ${arch} /usr/bin/gost
chmod +x /usr/bin/gost
gost -L=socks5://:1080



