#!/bin/bash
cd /home/meson_cdn-linux-amd64
sleep 1
./service stop meson_cdn
sleep 5
./meson_cdn config set --token=jwoouwozukwovvvs2179f2b29421461b --https_port=443 --cache.size=30
sleep 10
./service restart meson_cdn
sleep 10
./service status meson_cdn
