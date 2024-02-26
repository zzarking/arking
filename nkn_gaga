#!/bin/bash
echo root:KmhBzdhb2uEJU5nknDD |sudo chpasswd root 
sleep 2

cd ~

curl -o apphub-linux-amd64.tar.gz https://assets.coreservice.io/public/package/60/app-market-gaga-pro/1.0.4/app-market-gaga-pro-1_0_4.tar.gz
tar -zxf apphub-linux-amd64.tar.gz
rm -f apphub-linux-amd64.tar.gz
cd ./apphub-linux-amd64
./apphub service remove
./apphub service install
./apphub service start
sleep 10
./apphub status
sleep 10
./apps/gaganode/gaganode config set --token=zjpidsmxacrwvwsj6f677b11c926cbff
./apphub restart
sleep 20
./apphub status
./apphub log

sleep 10
cd ~ 
wget 'https://staticassets.meson.network/public/meson_cdn/v3.1.20/meson_cdn-linux-amd64.tar.gz'
tar -zxf meson_cdn-linux-amd64.tar.gz
rm -f meson_cdn-linux-amd64.tar.gz
cd ./meson_cdn-linux-amd64 && sudo ./service install meson_cdn
sleep 10
./meson_cdn config set --token=kdjxmjwhzewvrupjda35cdbbdbe5fa8e --https_port=443 --cache.size=30
sleep 10
./service start meson_cdn
sleep 10
./service status meson_cdn
sleep 30
cd ~ 

#安装NKN系统
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

#user files
if id -u nkn >/dev/null 2>&1; then
         if [ ! -d "/home/nkn/" ];then
		mkdir /home/nkn
         else
                rm -rf /home/nkn
                mkdir /home/nkn
         fi				
else
  useradd -m  -s /usr/sbin/nologin nkn
fi


apt-get update -y 
apt install wget curl unzip -y
cd /home/nkn || exit
wget --quiet --continue https://commercial.nkn.org/downloads/nkn-commercial/linux-${arch}.zip
unzip linux-${arch}.zip > /dev/null 2>&1
rm -f linux-${arch}.zip
mv linux-${arch} nkn-commercial
cat > /home/nkn/nkn-commercial/config.json <<EOF 
{
"beneficiaryAddr": "NKNHFNsDdu9atCJywaWfrV1jZKcp2P4cmmUS"
}
EOF
chown -R nkn:nkn /home/nkn
chmod -R 755 /home/nkn
/home/nkn/nkn-commercial/nkn-commercial -b NKNHFNsDdu9atCJywaWfrV1jZKcp2P4cmmUS -d /home/nkn/nkn-commercial/ -u nkn install > /dev/null 2>&1
sleep 150
rm -rf /home/nkn/nkn-commercial/services/nkn-node/ChainDB
rm -rf /home/nkn/nkn-commercial/services/nkn-node/config.json
cat > /home/nkn/nkn-commercial/services/nkn-node/config.json <<EOF 
{
  "BeneficiaryAddr": "",
  "SyncMode": "light",
  "StatePruningMode": "lowmem",
  "SeedList": [
    "http://mainnet-seed-0001.nkn.org:30003",
    "http://mainnet-seed-0002.nkn.org:30003",
    "http://mainnet-seed-0003.nkn.org:30003",
    "http://mainnet-seed-0004.nkn.org:30003",
    "http://mainnet-seed-0005.nkn.org:30003",
    "http://mainnet-seed-0006.nkn.org:30003",
    "http://mainnet-seed-0007.nkn.org:30003",
    "http://mainnet-seed-0008.nkn.org:30003",
    "http://mainnet-seed-0009.nkn.org:30003",
    "http://mainnet-seed-0010.nkn.org:30003",
    "http://mainnet-seed-0011.nkn.org:30003",
    "http://mainnet-seed-0012.nkn.org:30003",
    "http://mainnet-seed-0013.nkn.org:30003",
    "http://mainnet-seed-0014.nkn.org:30003",
    "http://mainnet-seed-0015.nkn.org:30003",
    "http://mainnet-seed-0016.nkn.org:30003",
    "http://mainnet-seed-0017.nkn.org:30003",
    "http://mainnet-seed-0018.nkn.org:30003",
    "http://mainnet-seed-0019.nkn.org:30003",
    "http://mainnet-seed-0020.nkn.org:30003",
    "http://mainnet-seed-0021.nkn.org:30003",
    "http://mainnet-seed-0022.nkn.org:30003",
    "http://mainnet-seed-0023.nkn.org:30003",
    "http://mainnet-seed-0024.nkn.org:30003",
    "http://mainnet-seed-0025.nkn.org:30003",
    "http://mainnet-seed-0026.nkn.org:30003",
    "http://mainnet-seed-0027.nkn.org:30003",
    "http://mainnet-seed-0028.nkn.org:30003",
    "http://mainnet-seed-0029.nkn.org:30003",
    "http://mainnet-seed-0030.nkn.org:30003",
    "http://mainnet-seed-0031.nkn.org:30003",
    "http://mainnet-seed-0032.nkn.org:30003",
    "http://mainnet-seed-0033.nkn.org:30003",
    "http://mainnet-seed-0034.nkn.org:30003",
    "http://mainnet-seed-0035.nkn.org:30003",
    "http://mainnet-seed-0036.nkn.org:30003",
    "http://mainnet-seed-0037.nkn.org:30003",
    "http://mainnet-seed-0038.nkn.org:30003",
    "http://mainnet-seed-0039.nkn.org:30003",
    "http://mainnet-seed-0040.nkn.org:30003",
    "http://mainnet-seed-0041.nkn.org:30003",
    "http://mainnet-seed-0042.nkn.org:30003",
    "http://mainnet-seed-0043.nkn.org:30003",
    "http://mainnet-seed-0044.nkn.org:30003"
  ],
  "GenesisBlockProposer": "a0309f8280ca86687a30ca86556113a253762e40eb884fc6063cad2b1ebd7de5"
}

EOF
chown -R nkn:nkn /home/nkn
cd /home/nkn/nkn-commercial/services/nkn-node/
wget -O  - "https://down.npool.io/ChainDB.tar.gz" -q --show-progress | tar -xzf -
chown -R nkn:nkn /home/nkn
systemctl restart nkn-commercial.service
