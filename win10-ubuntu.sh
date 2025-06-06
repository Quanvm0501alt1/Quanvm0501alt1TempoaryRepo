#!/bin/bash

echo "==================================================================="
echo "Starting Windows 10 VM setup script for Ubuntu/Debian..."
echo "Bắt đầu tập lệnh cài đặt máy ảo Windows 10 cho Ubuntu/Debian..."
echo "==================================================================="
echo ""

# --- Step 1: Update package lists ---
echo "--- Step 1: Updating package lists ---"
echo "--- Bước 1: Cập nhật danh sách gói ---"
sudo apt update
echo "Package lists updated successfully."
echo "Danh sách gói đã được cập nhật thành công."
echo ""

# --- Step 2: Install Docker and Docker Compose ---
echo "--- Step 2: Installing Docker and Docker Compose ---"
echo "--- Bước 2: Cài đặt Docker và Docker Compose ---"
# Install docker.io and docker-compose. Docker will handle its containerd dependency.
sudo apt install -y docker.io docker-compose
echo "Docker and Docker Compose installed."
echo "Docker và Docker Compose đã được cài đặt."
echo ""

# --- Step 3: Enable and start Docker services ---
echo "--- Step 3: Enabling and starting Docker services ---"
echo "--- Bước 3: Kích hoạt và khởi động các dịch vụ Docker ---"
# Enable and start the main Docker service. This usually handles the socket and containerd as well.
sudo systemctl enable docker --now
echo "Docker service enabled and started."
echo "Dịch vụ Docker đã được kích hoạt và khởi động."
echo ""

# --- Step 4: Prepare Docker Compose project directory ---
echo "--- Step 4: Creating Docker Compose project directory 'dockercom' ---"
echo "--- Bước 4: Tạo thư mục dự án Docker Compose 'dockercom' ---"
mkdir -p dockercom
cd dockercom || { echo "Failed to change directory to dockercom. Exiting."; echo "Không thể chuyển đến thư mục dockercom. Đang thoát."; exit 1; }
echo "Directory 'dockercom' created and entered."
echo "Thư mục 'dockercom' đã được tạo và truy cập."
echo ""

# --- Step 5: Create Docker Compose configuration file (win10.yml) ---
echo "--- Step 5: Creating Docker Compose configuration file 'win10.yml' ---"
echo "--- Bước 5: Tạo tệp cấu hình Docker Compose 'win10.yml' ---"
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
echo "File 'win10.yml' created successfully."
echo "Tệp 'win10.yml' đã được tạo thành công."
echo ""

# --- Step 6: Start Windows 10 container using Docker Compose (try modern, then old) ---
echo "--- Step 6: Starting Windows 10 container in detached mode ---"
echo "--- Bước 6: Khởi động vùng chứa Windows 10 ở chế độ nền ---"

# Try the modern 'docker compose' syntax first
echo "Attempting to start container with 'docker compose' (modern syntax)..."
sudo docker-compose -f win10.yml up -d

echo "Windows 10 container is now starting in the background."
echo "Vùng chứa Windows 10 hiện đang khởi động ở chế độ nền."
echo ""

echo "==================================================================="
echo "Setup complete for Ubuntu/Debian!"
echo "Thiết lập đã hoàn tất cho Ubuntu/Debian!"
echo ""
echo "To check the container status and logs, use:"
echo "Để kiểm tra trạng thái và nhật ký của vùng chứa, hãy sử dụng:"
echo "  docker ps -a"
echo "  docker logs windows"
echo ""
echo "Execute \"docker logs windows\" to see the Windows boot process and status."
echo "Chạy \"docker logs windows\" để xem quá trình khởi động và trạng thái của Windows."
echo "==================================================================="
