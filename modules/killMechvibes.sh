#!/bin/bash

cat << "EOF"

█ █ ███ █   █     █   █ ███ ███ █ █ █ █ ███ ██  ███ ███
█ █  █  █   █     ██ ██ █   █   █ █ █ █  █  █ █ █   █
██   █  █   █     █ █ █ ███ █   ███ █ █  █  ██  ███  █
█ █  █  █   █     █   █ █   █   █ █ █ █  █  █ █ █     █
█ █ ███ ███ ███   █   █ ███ ███ █ █  █  ███ ██  ███ ███

EOF

# This line pauses the script execution for 10 seconds.
sleep 10

# This line terminates (kills) all processes with the name 'mechvibes'.
killall mechvibes
