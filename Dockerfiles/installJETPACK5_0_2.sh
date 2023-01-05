#!/bin/bash
# Install NVIDIA Jetson AGX JetPack 5.0.2
# Called by DockerfileJETPACK5_0_2
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
# UPDATE for L4T of your choice
# Updated Jan 2023 to use JetPack 5.0.2 = v35.1.0
wget https://developer.nvidia.com/embedded/l4t/r35_release_v1.0/release/jetson_linux_r35.1.0_aarch64.tbz2
wget https://developer.nvidia.com/embedded/l4t/r35_release_v1.0/release/tegra_linux_sample-root-filesystem_r35.1.0_aarch64.tbz2

# Phase 2: extract tarballs
echo "Extracting NVIDIA tarballs - please be patient..."
#tar xf /jetson_linux_*_aarch64.tbz2 -C /
#tar xpf /tegra_linux_sample-root-filesystem_*_aarch64.tbz2 \
tar xf /jetson_linux_*_aarch64.tbz2 -C /
tar xpf /tegra_linux_sample-root-filesystem_*_aarch64.tbz2 \
  -C /Linux_for_Tegra/rootfs

# Phase 3: apply binaries (requires Ubuntu 18.04 env with qemu)
echo "Registering binfmts for qemu-aarch64, reqd for apply_binaries.sh"
mount binfmt_misc -t binfmt_misc /proc/sys/fs/binfmt_misc
sleep 1
update-binfmts --enable qemu-aarch64
update-binfmts --enable qemu-arm    
update-binfmts --enable qemu-armeb

echo "Executing apply_binaries.sh"
cd /Linux_for_Tegra && \
  ./apply_binaries.sh

###DEBUG
echo "still being DEBUGGED. Entering bash shell as root"
/bin/bash

# Phase 4: flash device (requires Ubuntu 18.04 env)
echo "Flashing AGX device and installing OS"
cd /Linux_for_Tegra && \
  ./flash.sh jetson-agx-xavier-devkit mmcblk0p1
