#!/bin/bash
echo root:KmhBzdhb2uEJU5nknDD |sudo chpasswd root 
sleep 10

sudo apt-get update -y && sudo apt-get install wget -y

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
./apps/gaganode/gaganode config set --token=dlrdjohudniaswpad604f27514f17a80
./apphub restart
sleep 20
./apphub status
./apphub log
