#!/bin/bash

# --- Script to detect Linux distribution and run appropriate Windows 10 VM setup ---
# --- Tập lệnh để phát hiện bản phân phối Linux và chạy thiết lập máy ảo Windows 10 phù hợp ---

WIN10_UBUNTU_SCRIPT_URL="https://raw.githubusercontent.com/Quanvm0501alt1/Quanvm0501alt1TempoaryRepo/refs/heads/main/win10-ubuntu.sh"
WIN10_ARCH_SCRIPT_URL="https://raw.githubusercontent.com/Quanvm0501alt1/Quanvm0501alt1TempoaryRepo/refs/heads/main/win10-arch.sh"

SETUP_SCRIPT_NAME="win10_docker_setup.sh"

echo "==================================================================="
echo "Starting OS detection for Windows 10 VM setup..."
echo "Bắt đầu phát hiện hệ điều hành để thiết lập máy ảo Windows 10..."
echo "==================================================================="
echo ""

# --- Step 1: Detect Linux Distribution ---
echo "--- Step 1: Detecting Linux Distribution ---"
echo "--- Bước 1: Phát hiện bản phân phối Linux ---"

DISTRO=""
if [ -f /etc/os-release ]; then
    . /etc/os-release
    if [[ "$ID" == "ubuntu" || "$ID" == "debian" ]]; then
        DISTRO="ubuntu_debian"
    elif [[ "$ID" == "arch" ]]; then
        DISTRO="arch"
    fi
fi

if [ -z "$DISTRO" ]; then
    echo "Error: Could not detect a supported Linux distribution (Ubuntu/Debian or Arch Linux)."
    echo "Lỗi: Không thể phát hiện bản phân phối Linux được hỗ trợ (Ubuntu/Debian hoặc Arch Linux)."
    echo "Please ensure you are running this script on one of these distributions."
    echo "Vui lòng đảm bảo bạn đang chạy tập lệnh này trên một trong các bản phân phối này."
    exit 1
fi

echo "Detected distribution: $DISTRO"
echo "Đã phát hiện bản phân phối: $DISTRO"
echo ""

# --- Step 2: Download the appropriate setup script ---
echo "--- Step 2: Downloading the appropriate setup script ---"
echo "--- Bước 2: Tải xuống tập lệnh thiết lập phù hợp ---"

DOWNLOAD_URL=""
case "$DISTRO" in
    "ubuntu_debian")
        DOWNLOAD_URL="$WIN10_UBUNTU_SCRIPT_URL"
        ;;
    "arch")
        DOWNLOAD_URL="$WIN10_ARCH_SCRIPT_URL"
        ;;
esac

echo "Downloading script from: $DOWNLOAD_URL"
echo "Đang tải xuống tập lệnh từ: $DOWNLOAD_URL"

# Check if curl is installed, install if not
if ! command -v curl &> /dev/null
then
    echo "curl is not installed. Attempting to install curl..."
    echo "curl chưa được cài đặt. Đang cố gắng cài đặt curl..."
    if [[ "$DISTRO" == "ubuntu_debian" ]]; then
        sudo apt update && sudo apt install -y curl
    elif [[ "$DISTRO" == "arch" ]]; then
        sudo pacman -Sy --noconfirm curl
    fi
    if ! command -v curl &> /dev/null
    then
        echo "Error: Failed to install curl. Please install curl manually and try again."
        echo "Lỗi: Không thể cài đặt curl. Vui lòng cài đặt curl thủ công và thử lại."
        exit 1
    fi
fi

curl -sL "$DOWNLOAD_URL" -o "$SETUP_SCRIPT_NAME"
if [ $? -ne 0 ]; then
    echo "Error: Failed to download the setup script from $DOWNLOAD_URL."
    echo "Lỗi: Không thể tải xuống tập lệnh thiết lập từ $DOWNLOAD_URL."
    echo "Please check your internet connection or the URL."
    echo "Vui lòng kiểm tra kết nối internet của bạn hoặc URL."
    exit 1
fi

chmod +x "$SETUP_SCRIPT_NAME"
echo "Setup script '$SETUP_SCRIPT_NAME' downloaded and made executable."
echo "Tập lệnh thiết lập '$SETUP_SCRIPT_NAME' đã được tải xuống và cấp quyền thực thi."
echo ""

# --- Step 3: Execute the setup script ---
echo "--- Step 3: Executing the Windows 10 VM setup script for $DISTRO ---"
echo "--- Bước 3: Đang thực thi tập lệnh thiết lập máy ảo Windows 10 cho $DISTRO ---"
sudo "./$SETUP_SCRIPT_NAME"

echo "==================================================================="
echo "Script finished. Please check the output above for setup details and next steps."
echo "Tập lệnh đã hoàn tất. Vui lòng kiểm tra đầu ra ở trên để biết chi tiết thiết lập và các bước tiếp theo."
echo "==================================================================="
