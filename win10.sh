#!/bin/bash

printf '%s\n' \
'#!/bin/bash' \
'' \
'sudo apt update' \
'' \
'sudo apt install -y docker.io docker-compose' \
'' \
'sudo apt-mark unhold containerd' \
'sudo apt remove -y containerd' \
'sudo apt remove -y --purge containerd containerd.io' \
'' \
'sudo apt update' \
'sudo apt install -y docker.io docker-compose' \
'' \
'sudo systemctl unmask docker' \
'sudo systemctl enable docker' \
'sudo systemctl start docker' \
'' \
'sudo systemctl unmask docker.socket' \
'sudo systemctl enable docker.socket' \
'sudo systemctl start docker.socket' \
'' \
'sudo systemctl enable docker.service' \
'sudo systemctl start docker.service' \
'' \
'sudo systemctl unmask containerd.service' \
'sudo systemctl enable containerd.service' \
'sudo systemctl start containerd.service' \
'' \
'mkdir -p dockercom' \
'cd dockercom && printf '"'"'%s\n'"'"' \' \
'  "version: '"'"'3'"'"'" \' \
'  "services:" \' \
'  "  windows:" \' \
'  "    image: dockurr/windows" \' \
'  "    container_name: windows" \' \
'  "    environment:" \' \
'  "      VERSION: \"10\"" \' \
'  "      USERNAME: \"MOCHIDZ032\"" \' \
'  "      PASSWORD: \"admin@123\"" \' \
'  "      RAM_SIZE: \"30G\"" \' \
'  "      CPU_CORES: \"16\"" \' \
'  "      DISK_SIZE: \"500G\"" \' \
'  "      DISK2_SIZE: \"100G\"" \' \
'  "    devices:" \' \
'  "      - /dev/kvm" \' \
'  "      - /dev/net/tun" \' \
'  "    cap_add:" \' \
'  "      - NET_ADMIN" \' \
'  "    ports:" \' \
'  "      - \"8006:8006\"" \' \
'  "      - \"3389:3389/tcp\"" \' \
'  "      - \"3389:3389/udp\"" \' \
'  "    stop_grace_period: 2m" \' \
'  "    volumes:" \' \
'  "      - /home:/storage" \' \
'> win10.yml' \
'' \
'sudo docker-compose -f win10.yml up -d' > 1.sh


chmod +x 1.sh


sudo ./1.sh
