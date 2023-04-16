# Home Directory Backup
# sudo rsync -aAXv --delete --exclude={/home/oyinbra/.local/share/Trash/,/home/oyinbra/Downloads/} /home /Backup
sudo rsync -aAXv --delete --exclude={/home/oyinbra/.local/share/Trash/,/home/oyinbra/Downloads/} /home /Backup

# PKG Backup
sudo rsync -aAXv --delete /var/cache/pacman/pkg /Backup

# etc Backup
# sudo rsync -aAXv --delete /etc /Backup

# crontab backup
sudo rsync -aAXv --delete /var/spool/cron /Backup

# Root usr share
# sudo rsync -aAXv --delete /usr/share /Backup
