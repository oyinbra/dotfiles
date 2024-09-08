#!/bin/bash

cat << "EOF"

███ █ █ █   █   ███ █   █   ███ ███ ███ ███ ███
█ █ █ █ ██  █   █ █ ██  █   █    █  █ █ █ █  █
██  █ █ █ █ █   █ █ █ █ █    █   █  █ █ ██   █
█ █ █ █ █  ██   █ █ █  ██     █  █  ███ █ █  █
█ █ ███ █   █   ███ █   █   ███  █  █ █ █ █  █

EOF

# This line pauses the script execution for time below in minutes.
sleep 10

# This line terminates (kills) all processes with the name 'mechvibes'.
# killall mechvibes

pkill -f docker
