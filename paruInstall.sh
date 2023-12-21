#!/bin/bash

cat << "EOF"

███ ███ ███ █ █   ███ █   █ ███ ███ ███ █   █   ███ ███ ███ ███ █   █
█ █ █ █ █ █ █ █    █  ██  █ █    █  █ █ █   █   █ █  █   █  █ █ ██  █
███ █ █ ██  █ █    █  █ █ █  █   █  █ █ █   █   █ █  █   █  █ █ █ █ █
█   ███ █ █ █ █    █  █  ██   █  █  ███ █   █   ███  █   █  █ █ █  ██
█   █ █ █ █ ███   ███ █   █ ███  █  █ █ ███ ███ █ █  █  ███ ███ █   █

EOF

# ---------------------------------------------------------
# Load function library from modules directory in Dotfiles
# ---------------------------------------------------------
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
# Check and create ~/Tmp directory
# ------------------------------------------------------
TMP_DIR="$HOME/Tmp"
if [ ! -d "$TMP_DIR" ]; then
  mkdir "$TMP_DIR"
fi

# ------------------------------------------------------
# Check if paru is installed
# ------------------------------------------------------
if sudo pacman -Qs paru > /dev/null ; then
    echo "paru is installed. You can proceed with the installation"
else
    echo "paru is not installed. Will be installed now!"
    _installPackagesPacman "base-devel"
    git clone https://aur.archlinux.org/paru-bin.git "$TMP_DIR/paru-bin"
    cd "$TMP_DIR/paru-bin"
    makepkg -si
    cd "$HOME/Dotfiles/"
    clear
    echo "paru has been installed successfully."
fi

cat << "EOF"

██  ███ █   █ ███
█ █ █ █ ██  █ █
█ █ █ █ █ █ █ ███
█ █ █ █ █  ██ █
██  ███ █   █ ███

EOF
