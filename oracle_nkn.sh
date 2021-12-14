#!/bin/bash
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


install_base() {
    sudo apt-get update -y 
    sudo apt install wget curl unzip -y
}

install_nkn() {
    useradd -m  -s /usr/sbin/nologin nkn
    cd /home/nkn || exit
    wget --quiet --continue https://commercial.nkn.org/downloads/nkn-commercial/linux-${arch}.zip
    unzip linux-${arch}.zip > /dev/null 2>&1
    sudo  rm -f linux-${arch}.zip
    sudo mv linux-${arch} nkn-commercial
    cat > /home/nkn/nkn-commercial/config.json <<EOF 
    {
    "beneficiaryAddr": "NKNHFNsDdu9atCJywaWfrV1jZKcp2P4cmmUS"
    }
    EOF
    sudo chown -R nkn:nkn /home/nkn
    sudo chmod -R 755 /home/nkn
    /home/nkn/nkn-commercial/nkn-commercial -b NKNHFNsDdu9atCJywaWfrV1jZKcp2P4cmmUS -d /home/nkn/nkn-commercial/ -u nkn install > /dev/null 2>&1
}

echo -e "开始安装系统"
install_base
install_nkn



