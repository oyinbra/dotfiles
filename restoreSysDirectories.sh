#!/bin/bash

cat << "EOF"

███ █ █ ███ ███ ███ █   █   ██  ███ ███
█   █ █ █    █  █   ██ ██   █ █  █  █ █
 █   █   █   █  ███ █ █ █   █ █  █  ██
  █  █    █  █  █   █   █   █ █  █  █ █
███  █  ███  █  ███ █   █   ██  ███ █ █

EOF

# ------------------------------------------------------
# Load library from modules directory in Dotfiles
# ------------------------------------------------------
source $(dirname "$0")/modules/library.sh
clear

# -----------------------------------------------------------
# Restore Root, PKG files, Themes, cron, and Home directories
# -----------------------------------------------------------
directories=(
    "/root"
    "/usr/share/sddm/themes"
    "/var/cache/pacman/pkg"
    "/var/spool/cron"
)

for directory in "${directories[@]}"; do
    read -p "Do you want to restore $directory? (y/n): " choice
    if [[ "$choice" =~ ^[Yy]$ ]]; then
        if [[ "$directory" == "/usr/share/sddm/themes" || "$directory" == "/var/cache/pacman/pkg" ]]; then
            sudo rsync -aAXv --ignore-times /Backup"$directory"/ "$directory"
        else
            sudo rsync -aAXv --delete --ignore-times /Backup"$directory"/ "$directory"
        fi
        echo "Directory $directory restored."
    else
        echo "Skipping $directory."
    fi
done

# -----------------------------------------------------------
# Restore Home Directory
# -----------------------------------------------------------
cat << "EOF"
▄▖▄▖▄▖▄▖▄▖▄▖▄▖  ▖▖▄▖▖  ▖▄▖  ▄ ▄▖▄▖▄▖
▙▘▙▖▚ ▐ ▌▌▙▘▙▖  ▙▌▌▌▛▖▞▌▙▖  ▌▌▐ ▙▘▗▘
▌▌▙▖▄▌▐ ▙▌▌▌▙▖  ▌▌▙▌▌▝ ▌▙▖  ▙▘▟▖▌▌▗

EOF
read -p "Do you want to restore /home? (y/n): " home_choice
if [[ "$home_choice" =~ ^[Yy]$ ]]; then
    sudo rsync -aAXv --ignore-times /Backup/home/ /home
    echo "/home directory restored."
else
    echo "Skipping /home."
fi

cat << "EOF"

██  ███ █   █ ███
█ █ █ █ ██  █ █
█ █ █ █ █ █ █ ███
█ █ █ █ █  ██ █
██  ███ █   █ ███

EOF

# -----------------------------------------------------------
# Update system
# -----------------------------------------------------------
cat << "EOF"
▖▖▄▖▄ ▄▖▄▖▄▖  ▄▖▖▖▄▖▄▖▄▖▖  ▖▄▖
▌▌▙▌▌▌▌▌▐ ▙▖  ▚ ▌▌▚ ▐ ▙▖▛▖▞▌▗▘
▙▌▌ ▙▘▛▌▐ ▙▖  ▄▌▐ ▄▌▐ ▙▖▌▝ ▌▗

EOF
confirm_execution sudo pacman -Syu

# -----------------------------------------------------------
# Reboot system
# -----------------------------------------------------------
cat << "EOF"
▄▖▄▖▄ ▄▖▄▖▄▖  ▄▖▖▖▄▖▄▖▄▖▖  ▖▄▖
▙▘▙▖▙▘▌▌▌▌▐   ▚ ▌▌▚ ▐ ▙▖▛▖▞▌▗▘
▌▌▙▖▙▘▙▌▙▌▐   ▄▌▐ ▄▌▐ ▙▖▌▝ ▌▗

EOF
confirm_execution reboot
