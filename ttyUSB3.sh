#!/bin/bash
#
# Configures serial port and starts minicom term emulator

port="/dev/ttyUSB3"

# check if minicom is installed
if ! command -v minicom &> /dev/null; then
    echo "minicom not found, exiting"
    exit 1
fi

# check if port exists (character device)
if [ -c "$port" ]; then
    echo "$port exists, continuing..."
else
    echo "$port not found, exiting"
    exit 1
fi

# Proceed...
echo "Disabling HW flow cntrl on $port  UART port"
stty -F $port -ixon 

echo "Connecting to $port"
minicom -D $port -8 -b 115200
