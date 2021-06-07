#  John Harrigan - May 2021
#--------------------------
# Requires installation of NVIDIA jetson-control repo
# $ git clone
# nuc7# python3 --version     ← Python 3.6.8
# nuc7# pip3 install pyftdi
# nuc7# git clone https://github.com/NVIDIA/python-jetson
# nuc7# cd jetson-control
# nuc7# pip3 install .            ← runs setup.py
#       Successfully installed python-jetson-0.0.0
# nuc7# jetson-control devices
#--------------------------------------------------------------------

# Notify user
echo "> Issuing button press sequence to put Jetson AGX into RCM mode"
echo "> ... please wait ~15 sec ..."

# Ensure AGX is powered-off
jetson-control press power
sleep 12
jetson-control release power

# Begin forced recovery mode button sequence
#jetson-control --device 001:003 press recovery
jetson-control press recovery
jetson-control press power
sleep 1
jetson-control release power
sleep 1
jetson-control release recovery
sleep 3
# should display
#
echo "> If successfully put in forced recovery mode, then lsusb should return:"
echo ">    Bus <bbb> Device <ddd>: ID 0955:7019 Nvidia Corp."
echo -n "     lsusb returned: "
lsusb | grep -i nvidia
