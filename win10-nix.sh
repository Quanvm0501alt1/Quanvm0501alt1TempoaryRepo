#!/bin/bash

# Update package lists and install Docker and Docker Compose
sudo apt update
sudo apt install -y docker.io docker-compose

# Remove existing containerd installations to avoid conflicts
# This ensures a clean slate for Docker's bundled containerd
sudo apt-mark unhold containerd # If containerd was held, unhold it
sudo apt remove -y --purge containerd containerd.io

# Re-install Docker and Docker Compose after potential containerd removal
# This step might be redundant if the first install succeeded and no containerd issues arose
sudo apt update
sudo apt install -y docker.io docker-compose

# Ensure Docker services are unmasked, enabled, and started
# Unmasking ensures that systemd won't prevent them from starting
sudo systemctl unmask docker
sudo systemctl enable docker
sudo systemctl start docker

sudo systemctl unmask docker.socket
sudo systemctl enable docker.socket
sudo systemctl start docker.socket

sudo systemctl unmask docker.service
sudo systemctl enable docker.service
sudo systemctl start docker.service

# Ensure containerd service (part of Docker) is unmasked, enabled, and started
sudo systemctl unmask containerd.service
sudo systemctl enable containerd.service
sudo systemctl start containerd.service

# Create a directory for the Docker Compose file and navigate into it
mkdir -p dockercom
cd dockercom || exit # Exit if cd fails

# Create the docker-compose.yml file for the Windows container
# Using a HEREDOC for cleaner multi-line string output
cat <<EOF > win10.yml
version: '3'
services:
  windows:
    image: dockurr/windows
    container_name: windows
    environment:
      VERSION: "10"
      USERNAME: "MOCHIDZ032"
      PASSWORD: "admin@123"
      RAM_SIZE: "30G"
      CPU_CORES: "16"
      DISK_SIZE: "500G"
      DISK2_SIZE: "100G"
    devices:
      - /dev/kvm
      - /dev/net/tun
    cap_add:
      - NET_ADMIN
    ports:
      - "8006:8006"
      - "3389:3389/tcp"
      - "3389:3389/udp"
    stop_grace_period: 2m
    volumes:
      - /home:/storage
EOF

# Start the Docker Compose services in detached mode
sudo docker-compose -f win10.yml up -d
