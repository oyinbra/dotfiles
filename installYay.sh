#!/bin/bash

cat << "EOF"

██╗   ██╗ █████╗ ██╗   ██╗
╚██╗ ██╔╝██╔══██╗╚██╗ ██╔╝
 ╚████╔╝ ███████║ ╚████╔╝
  ╚██╔╝  ██╔══██║  ╚██╔╝
   ██║   ██║  ██║   ██║
   ╚═╝   ╚═╝  ╚═╝   ╚═╝                                

EOF

# ------------------------------------------------------
# Load library from modules directory in Dotfiles
# ------------------------------------------------------
source $(dirname "$0")/modules/library.sh
clear

cat << "EOF"

██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗
██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║
██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║
██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║
██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗
╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝

EOF

# ------------------------------------------------------
# Check and create ~/Tmp directory
# ------------------------------------------------------
TMP_DIR="$HOME/Tmp"
if [ ! -d "$TMP_DIR" ]; then
  mkdir "$TMP_DIR"
fi

# ------------------------------------------------------
# Check if yay is installed
# ------------------------------------------------------
if sudo pacman -Qs yay > /dev/null ; then
    echo "yay is installed. You can proceed with the installation"
else
    echo "yay is not installed. Will be installed now!"
    _installPackagesPacman "base-devel"
    git clone https://aur.archlinux.org/yay-git.git "$TMP_DIR/yay-git"
    cd "$TMP_DIR/yay-git"
    makepkg -si
    cd "$HOME/Dotfiles/"
    clear
    echo "yay has been installed successfully."
fi