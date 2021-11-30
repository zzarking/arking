#!/bin/bash
wget "https://github.com/ginuerzh/gost/releases/download/v2.8.1/gost_2.8.1_linux_amd64.tar.gz"
tar -zxvf gost_2.8.1_linux_amd64.tar.gz
mv gost_2.8.1_linux_amd64/gost /usr/bin/gost
chmod +x /usr/bin/gost
gost -L=socks5://:1080
