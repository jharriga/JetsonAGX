# JetsonAGX
Scripts and Dockerfiles for working with NVIDIA Jetson AGX Development kit

NOTE: requires an x86-based Linux system with both Jetson AGX USB ports connected

Nvidia L4T download area  https://developer.nvidia.com/embedded/linux-tegra

SHELL SCRIPTS:
* rcmautomate.sh - issues button presses to put Jetson AGX in Forced Recovery Mode
* ttyUSB2.sh - connects to Jetson AGX sytem using minicom terminal utility
* Dependencies: python3, https://github.com/NVIDIA/python-jetson

DOCKERFILES:
* DockerfileDEVICES - uses jetson-control utils to identify USB attached Jetson AGX
* DockerfileFACTORY - flashes AGX with NVIDIA Factory Ubuntu bits (installFACTORY.sh)
* DockerfileLSUSB - probes USB looking for attached Jetson AGX
* DockerfileRCM - Places USB attached Jetson AGX into recovery mode (for flashing)

EXTERNAL RESOURCES
* Hardware configuration video  https://www.youtube.com/watch?v=-nX8eD7FusQ
* Install NVMe on Xavier AGX  https://www.youtube.com/watch?v=x0TBTYw7HKs
