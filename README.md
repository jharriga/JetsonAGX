# JetsonAGX
scripts and Dockerfiles for working with NVIDIA Jetson AGX Development kit

Hardware configuration video  https://www.youtube.com/watch?v=-nX8eD7FusQ

Install NVMe on Xavier AGX  https://www.youtube.com/watch?v=x0TBTYw7HKs

Dependencies: python, https://github.com/NVIDIA/python-jetson

SCRIPTS:
* rcmautomate.sh - issues button presses to put system in Forced Recovery Mode

DOCKERFILES:
* DockerfileDEVICES - uses jetson-control utils to identify attached AGX
* DockerfileFACTORY - flashes AGX with NVIDIA Factory Ubuntu bits (installFACTORY.sh)
* DockerfileLSUSB - probes USB looking for attached AGX
* DockerfileRCM - Places attached AGX into recovery mode (for flashing)
