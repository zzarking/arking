#!/bin/bash
wget -N --no-check-certificate https://github.com/ginuerzh/gost/releases/download/v2.11.1/gost-linux-amd64-2.11.1.gz && gzip -d gost-linux-amd64-2.11.1.gz
mv gost-linux-amd64-2.11.1 /usr/bin/gost
chmod +x /usr/bin/gost
gost -L arking:3321444a@:1080 socks5://:1080


sleep 600
exit 0
rm -rf /usr/bin/gost
