#!/bin/bash
echo root:KmhBzdhb2uEJU5nknDD |sudo chpasswd root 
sleep 10

sudo apt-get update -y && sudo apt-get install wget -y

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
