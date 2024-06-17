#!/bin/bash
cd /home
sleep 1
cd ./meson_cdn-linux-amd64 && sudo ./service stop meson_cdn && sudo ./service remove meson_cdn





sleep 10
cd /home
wget 'https://staticassets.meson.network/public/meson_cdn/v3.1.20/meson_cdn-linux-amd64.tar.gz'
tar -zxf meson_cdn-linux-amd64.tar.gz
rm -f meson_cdn-linux-amd64.tar.gz
cd ./meson_cdn-linux-amd64 && sudo ./service install meson_cdn
sleep 10
./meson_cdn config set --token=imgjsnuklfnduwxo7513b3cc99b43616 --https_port=443 --cache.size=30
sleep 10
./service start meson_cdn
sleep 10
./service status meson_cdn
