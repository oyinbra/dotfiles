#!/bin/bash

cat << "EOF"

███ █   █ ███ █   █ ███   ███ ███ ███ █ █ ███ ███ ███ ███
█   ██  █ █ █ ██ ██ █     █ █ █ █ █   █ █ █ █ █   █   █
█   █ █ █ █ █ █ █ █ ███   ███ █ █ █   ██  █ █ █   ███  █
█ █ █  ██ █ █ █   █ █     █   ███ █   █ █ ███ █ █ █     █
███ █   █ ███ █   █ ███   █   █ █ ███ █ █ █ █ ███ ███ ███

EOF

# ------------------------------------------------------
# Load library from modules directory in Dotfiles
# ------------------------------------------------------
source $(dirname "$0")/modules/library.sh
clear

cat << "EOF"

███ █   █ ███ ███ ███ █   █
 █  ██  █ █    █  █ █ █   █
 █  █ █ █  █   █  █ █ █   █
 █  █  ██   █  █  ███ █   █
███ █   █ ███  █  █ █ ███ ███

EOF

# ------------------------------------------------------
# Confirm Start
# ------------------------------------------------------
confirm_start

packagesPacman=(
    "gnome-tweaks"
    "gnome-shell-extensions"
    "gnome-browser-connector"
);
  
# ------------------------------------------------------
# Install required packages
# ------------------------------------------------------
_installPackagesPacman "${packagesPacman[@]}";

