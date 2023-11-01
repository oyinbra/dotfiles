#!/bin/bash

# Restore Root, PKG files, Themes and cron
directories=(
   "/root"
   "/usr/share/sddm/themes"
   "/var/cache/pacman/pkg"
   "/var/spool/cron"
)

for directory in "${directories[@]}"; do
    if [[ "$directory" == "/usr/share/sddm/themes" || "$directory" == "/var/cache/pacman/pkg" ]]; then
        sudo rsync -aAXv --ignore-times /Backup/"$directory"/ "$directory"
    else
        sudo rsync -aAXv --delete --ignore-times /Backup/"$directory"/ "$directory"
    fi
done

# Restore Home Directory
sudo rsync -aAXv --ignore-times /Backup/home/ /home

# Update system
sudo pacman -Syu
