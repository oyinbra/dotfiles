#!/bin/bash

cat << "EOF"

██  ███ ███ █ █ █ █ ███   ███ █ █ ███
█ █ █ █ █   █ █ █ █ █ █   █   █ █ █
██  █ █ █   ██  █ █ ███    █   █   █
█ █ ███ █   █ █ █ █ █       █  █    █
██  █ █ ███ █ █ ███ █     ███  █  ███

EOF

# ------------------------------------------------------
# Load library from modules directory in Dotfiles
# ------------------------------------------------------
source $(dirname "$0")/modules/library.sh
clear

cat << "EOF"
▄▖▄▖▄▖▄▖▄▖  ▄▖▖▖▄▖  ▄ ▄▖▄▖▖▖▖▖▄▖
▚ ▐ ▌▌▙▘▐   ▚ ▌▌▚   ▙▘▌▌▌ ▙▘▌▌▙▌
▄▌▐ ▛▌▌▌▐   ▄▌▐ ▄▌  ▙▘▛▌▙▖▌▌▙▌▌

EOF
confirm_start

# ------------------------------------------------------
# Backup home directory
# ------------------------------------------------------
sudo rsync -aAXv --delete --exclude={"/home/oyinbra/.local/share/Trash/","/home/oyinbra/Downloads/","/home/oyinbra/.docker/"} /home /Backup

# ------------------------------------------------------
# Backup important directory
# ------------------------------------------------------
directories=(
    "/root"
    "/usr"
    "/var/cache/pacman/pkg"
)

for directory in "${directories[@]}"; do
    sudo rsync -aAXv "$directory" /Backup
done

cat << "EOF"

██  ███ █   █ ███
█ █ █ █ ██  █ █
█ █ █ █ █ █ █ ███
█ █ █ █ █  ██ █
██  ███ █   █ ███

EOF
