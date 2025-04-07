#!/bin/bash
# NVIDIA CUDA Setup Script for Ubuntu 24.04
# This script installs CUDA toolkit and drivers on Ubuntu 24.04

set -e  # Exit on error

echo "🔄 Updating system packages..."
sudo apt update
sudo apt upgrade -y

echo "📦 Downloading NVIDIA CUDA keyring..."
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2404/x86_64/cuda-keyring_1.1-1_all.deb

echo "🔑 Installing CUDA keyring..."
sudo dpkg -i cuda-keyring_1.1-1_all.deb

echo "📋 Updating package lists..."
sudo apt-get update

echo "🛠️ Installing CUDA Toolkit 12.8..."
sudo apt-get -y install cuda-toolkit-12-8 

echo "📦 Installing additional CUDA packages..."
sudo apt-get install -y nvidia-cuda-toolkit

echo "🖥️ Installing CUDA Drivers..."
sudo apt-get -y install cuda-drivers

echo "⚙️ Installing CUDA..."
sudo apt-get -y install cuda

echo "🔍 Checking NVIDIA driver installation..."
nvidia-smi

echo "✅ CUDA installation complete!"
echo "⚠️ For the changes to take effect, a system reboot is recommended."

# Ask user for reboot confirmation
read -p "🔄 Would you like to reboot now? (y/N): " reboot_choice
if [[ "$reboot_choice" =~ ^[Yy]$ ]]; then
    echo "🔄 Rebooting system..."
    sudo reboot
else
    echo "🛑 Reboot skipped. Please reboot your system later to complete the installation."
    echo "💡 After reboot, you can verify CUDA installation with:"
    echo "   nvcc --version"
    echo "   nvidia-smi"
fi
# Note: If you encounter issues with the NVIDIA driver, you may need to blacklist Nouveau drivers.
# To do this, create a file /etc/modprobe.d/blacklist-nouveau.conf with the following content:
# blacklist nouveau
# options nouveau modeset=0
# Then run:
# sudo update-initramfs -u
# and reboot your system.
# Note: This script is intended for Ubuntu 24.04 and may not work on other versions.        
# Always check the official NVIDIA documentation for the latest installation instructions.
# Note: This script assumes you have sudo privileges and an internet connection.