# JetsonAGX
Scripts and Dockerfiles for working with NVIDIA Jetson AGX Development kit

NOTE: requires an x86-based Linux system with Jetson AGX USB ports connected

FROM NVIDIA L4T Quickstart Guide:
* Your Jetson developer kit is powered off, and is connected as follows
* A USB cable connects the correct USB port on your Jetson developer kit to a host computer to be used for flashing and other development support functions.
* For the NVIDIA Jetson AGX Xavier Developer Kit, two USB ports. For serial console access sue the USB-B port to the left of the GPIO expansion header. For flashing, use the USB-C port to the right of the GPIO expansion header. 
* For the other Jetson developer kits, use the micro USB port.

SHELL SCRIPTS:
* rcmautomate.sh - issues button presses to put Jetson AGX in Forced Recovery Mode
* ttyUSB3.sh - connects to Jetson AGX sytem using minicom terminal utility
* Dependencies: python3, https://github.com/NVIDIA/python-jetson

JETPACK DOCKERFILES:  <-- see each 'Dockerfile' for build and run instructions
* ORDER OF EXECUTION - to flash Jetson AGX to Nvidia L4T software
1. DockerfileRCM_JETPACK - Places USB attached Jetson AGX into recovery mode (for flashing)
2. DockerfileJETPACK'version' - flashes AGX with NVIDIA Factory L4T/Ubuntu bits (CMD installJETPACK'version'.sh)
* **NOTE:** if DockerJETPACK'version' fails you must go back to Step #1

ADDITIONAL UTILITIES:
1. Utils/DockerfileUEFI - flashes AGX with NVIDIA experimental UEFI firmware (CMD installUEFI.sh)
* **NOTE:** this only flashes UEFI firmware and doesn't install an Operating System
2. Utils/DockerfileLSUSB - probes USB looking for attached Jetson AGX
3. Utils/DockerfileDEVICES - uses jetson-control utils to identify USB attached Jetson AGX

EXTERNAL RESOURCES
* Nvidia L4T download area  https://developer.nvidia.com/embedded/linux-tegra
* Hardware configuration video  https://www.youtube.com/watch?v=-nX8eD7FusQ
* Install NVMe on Xavier AGX  https://www.youtube.com/watch?v=x0TBTYw7HKs
