#!/bin/bash

# System Directory Restores
directories=(
   "/root"
   "/usr/share/sddm/themes"
   "/var/cache/pacman/pkg"
   "/var/spool/cron"
)

# Creating a backup of bin and share diretory
# sudo cp -R /usr/share /usr/share.bak

for directory in "${directories[@]}"; do
    if [[ "$directory" == "/usr/share/sddm/themes" ]]; then
        sudo rsync -aAXv /Backup/"$directory"/ "$directory"
    else
        sudo rsync -aAXv --delete --ignore-times /Backup/"$directory"/ "$directory"
    fi
done

# Restore Home Directory
sudo rsync -aAXv --delete --ignore-times /Backup/home/ /home

# Update system
sudo pacman -Syu
