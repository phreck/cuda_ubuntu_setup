# NVIDIA CUDA Setup for Ubuntu 24.04

This repository contains scripts and instructions for setting up NVIDIA CUDA drivers and toolkit on Ubuntu 24.04 systems.

## Prerequisites

- A computer with an NVIDIA GPU
- Ubuntu 24.04 installed
- Administrative (sudo) privileges
- Internet connection

## Installation Options

### Option 1: Automated Installation (Recommended)

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/puget_ubuntu_setup.git
   cd puget_ubuntu_setup
   ```

2. Make the script executable:
   ```bash
   chmod +x cuda_setup.sh
   ```

3. Run the installation script:
   ```bash
   ./cuda_setup.sh
   ```

4. Follow the on-screen prompts. The script will:
   - Update your system
   - Download and install NVIDIA CUDA repository keyring
   - Install CUDA Toolkit 12.8
   - Install CUDA drivers
   - Offer to reboot your system (recommended)

### Option 2: Manual Installation

If you prefer to install manually, run the following commands:

```bash
sudo apt update
sudo apt upgrade
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2404/x86_64/cuda-keyring_1.1-1_all.deb
sudo dpkg -i cuda-keyring_1.1-1_all.deb
sudo apt-get update
sudo apt-get -y install cuda-toolkit-12-8
sudo apt-get -y install cuda-drivers
sudo apt-get -y install cuda
```

## Verification

After installation and system reboot, verify that CUDA is correctly installed:

```bash
# Check NVIDIA driver installation
nvidia-smi

# Check CUDA version
nvcc --version
```

## Troubleshooting

### Nouveau Driver Conflicts

If you encounter issues with the NVIDIA driver, you may need to blacklist the Nouveau drivers:

1. Create a file `/etc/modprobe.d/blacklist-nouveau.conf` with the following content:
   ```
   blacklist nouveau
   options nouveau modeset=0
   ```

2. Update initramfs and reboot:
   ```bash
   sudo update-initramfs -u
   sudo reboot
   ```

### Installation Errors

If you encounter installation errors, check:
- Your GPU model is supported by CUDA 12.8
- Your internet connection is stable
- You have sufficient disk space available

## Additional Resources

- [Official NVIDIA CUDA Documentation](https://docs.nvidia.com/cuda/)
- [NVIDIA CUDA Download Page](https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=Ubuntu&target_version=24.04&target_type=deb_network)

## License

This project is licensed under the MIT License - see the LICENSE file for details.

---

*Last updated: April 7, 2025*
