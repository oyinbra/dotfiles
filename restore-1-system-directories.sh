#!/bin/bash

# System Directory Restores
directories=(
   "/root"
   "/usr/bin"
   "/usr/share"
   "/var/cache/pacman/pkg"
   "/var/spool/cron"
)

# Creating a backup of bin and share directory
sudo cp -R /usr/bin /usr/bin.bak
sudo cp -R /usr/share /usr/share.bak

for directory in "${directories[@]}"; do
    if [[ "$directory" == "/usr/bin" || "$directory" == "/usr/share" ]]; then
        sudo rsync -aAXv /run/media/$USER/Backup/"$directory"/ "$directory"
    else
        sudo rsync -aAXv --delete --ignore-times /run/media/$USER/Backup/"$directory"/ "$directory"
    fi
done

# Restore Home Directory
sudo rsync -aAXv --delete --ignore-times /run/media/$USER/Backup/home/ /home

# Update system
sudo pacman -Syu
