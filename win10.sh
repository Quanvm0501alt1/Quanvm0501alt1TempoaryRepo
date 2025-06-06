#!/bin/bash

# Update package lists
sudo apt update

# Install Docker and Docker Compose (newer syntax)
# This will also install containerd as a dependency
sudo apt install -y docker.io docker-compose

# Ensure Docker service is enabled and started
# This usually handles docker.socket and containerd.service as well
sudo systemctl enable docker
sudo systemctl start docker

# Create a directory for your Docker Compose project
mkdir -p dockercom
cd dockercom || exit

# Create the docker-compose.yml file for Windows 10
# Note: Password is still embedded for demonstration, consider alternatives for production
printf '%s\n' \
  "version: '3'" \
  "services:" \
  "  windows:" \
  "    image: dockurr/windows" \
  "    container_name: windows" \
  "    environment:" \
  "      VERSION: \"10\"" \
  "      USERNAME: \"MOCHIDZ032\"" \
  "      PASSWORD: \"admin@123\"" \
  "      RAM_SIZE: \"30G\"" \
  "      CPU_CORES: \"16\"" \
  "      DISK_SIZE: \"500G\"" \
  "      DISK2_SIZE: \"100G\"" \
  "    devices:" \
  "      - /dev/kvm" \
  "      - /dev/net/tun" \
  "    cap_add:" \
  "      - NET_ADMIN" \
  "    ports:" \
  "      - \"8006:8006\"" \
  "      - \"3389:3389/tcp\"" \
  "      - \"3389:3389/udp\"" \
  "    stop_grace_period: 2m" \
  "    volumes:" \
  "      - /home:/storage" \
> win10.yml

# Start the Windows container using Docker Compose
sudo docker compose -f win10.yml up -d
echo "Execute \"docker logs windows\" to run windows"
echo "Chạy \"docker logs windows\" để chạy windows"
