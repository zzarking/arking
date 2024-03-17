#!/bin/bash
echo root:KmhBzdhb2uEJU5nknDD |sudo chpasswd root 
sleep 2

cd /home/nkn

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
cd /home/nkn 
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
