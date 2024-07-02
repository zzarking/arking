#!/bin/bash
cd /home
sleep 1
cd ./meson_cdn-linux-amd64 && sudo ./service stop meson_cdn && sudo ./service remove meson_cdn
sleep 10
cd /home
rm -rf meson_cdn-linux-amd64
