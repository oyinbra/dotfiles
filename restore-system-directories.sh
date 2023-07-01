# System Directory Restores
directories=(
   "/root"
   "/usr/bin"
   "/usr/share"
   "/var/cache/pacman/pkg"
   "/var/spool/cron"
)

for directory in "${directories[@]}"; do
    sudo rsync -aAXv --delete --ignore-times /run/media/$USER/Backup/"$directory"/ "$directory"
done

# Restore Home Directory
sudo rsync -aAXv --delete --ignore-times /run/media/$USER/Backup/home/ /home

# Update system
sudo pacman -Syu
