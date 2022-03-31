#!/bin/bash
# Install NVIDIA Jetson AGX UEFI software
# Called by DockerfileUEFI
#
# NOTE: does not install an operating system
##################################################

# 
# Phase 1: detect AGX
echo "Script exits if unable to detect AGX device"
retcode=$(lsusb | grep -i nvidia)
if [ "$retcode" ]; then
    echo "> SUCCESS. AGX is available for flashing. Continuing..."
else
    echo "> FAIL. AGX is not found. Exiting"
    exit 1
fi

# Phase 2: Download NVIDIA packages
cd /
echo "Downloading NVIDIA tarballs - please be patient..."
# UPDATE for Nvidia SW versions of your choice
wget https://developer.nvidia.com/embedded/l4t/r32_release_v6.1/t186/jetson_linux_r32.6.1_aarch64.tbz2
wget https://developer.nvidia.com/assets/embedded/downloads/nvidia_uefiacpi_experimental_firmware/nvidia-l4t-jetson-uefi-r32.6.1-20211119125725.tbz2

# Phase 3: extract tarballs
echo "Extracting NVIDIA tarballs - please be patient..."
tar xf /jetson_linux_*_aarch64.tbz2 -C /
# extract UEFI pkg over the top of '/Linux_for_Tegra' tree
tar xpf /nvidia-l4t-jetson-uefi-*.tbz2 -C /

###DEBUG
/bin/bash

# Phase 4: flash device (requires Ubuntu 18.04 env)
echo "Flashing AGX device with UEFI firmware"
cd /Linux_for_Tegra && \
  ./flash.sh jetson-xavier-uefi-min external
