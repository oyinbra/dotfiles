#!/bin/bash

cat << "EOF"

 ██████████                                                     █████   
░░███░░░░░█                                                    ░░███    
 ░███  █ ░  ████████    ██████  ████████  █████ ████ ████████  ███████  
 ░██████   ░░███░░███  ███░░███░░███░░███░░███ ░███ ░░███░░███░░░███░   
 ░███░░█    ░███ ░███ ░███ ░░░  ░███ ░░░  ░███ ░███  ░███ ░███  ░███    
 ░███ ░   █ ░███ ░███ ░███  ███ ░███      ░███ ░███  ░███ ░███  ░███ ███
 ██████████ ████ █████░░██████  █████     ░░███████  ░███████   ░░█████ 
░░░░░░░░░░ ░░░░ ░░░░░  ░░░░░░  ░░░░░       ░░░░░███  ░███░░░     ░░░░░  
                                           ███ ░███  ░███               
                                          ░░██████   █████              
                                           ░░░░░░   ░░░░░               

EOF

# Create a mount point
sudo mkdir -p /Backup

# Add an entry to /etc/crypttab to automatically unlock the encrypted partition during boot
echo "encrypted_backup /dev/nvme0n1p5 none" | sudo tee -a /etc/crypttab

# Add an entry to /etc/crypttab to automatically unlock the encrypted partition during boot

echo "/dev/mapper/encrypted_backup /Backup btrfs defaults 0 0" | sudo tee -a /etc/fstab

# Optionally, set permissions on the mount point to allow regular users to access it
sudo chmod 777 /Backup
# Replace oyinbra:oyinbra with your own username
sudo chown -R oyinbra:oyinbra /Backup
