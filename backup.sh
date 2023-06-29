#!/bin/bash

# Home Directory Backup
sudo rsync -aAXv --delete --exclude={"/home/oyinbra/.local/share/Trash/","/home/oyinbra/Downloads/"} /home /Backup

# System Directory Backups
directories=(
    "/var"
    "/root"
    "/opt"
    "/usr/local"
    "/usr/share"
)

for directory in "${directories[@]}"; do
    sudo rsync -aAXv "$directory" /Backup
done
