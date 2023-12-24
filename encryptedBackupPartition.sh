#!/bin/bash

cat << "EOF"
 _____                             _           _
| ____|_ __   ___ _ __ _   _ _ __ | |_ ___  __| |
|  _| | '_ \ / __| '__| | | | '_ \| __/ _ \/ _` |
| |___| | | | (__| |  | |_| | |_) | ||  __/ (_| |
|_____|_| |_|\___|_|   \__, | .__/ \__\___|\__,_|
                       |___/|_|
EOF

# -----------------------------------------
# Create a mount point
# -----------------------------------------
MOUNT_POINT="/Backup"
sudo mkdir -p "$MOUNT_POINT"

# Add an entry to /etc/crypttab to automatically unlock the encrypted partition during boot
CRYPT_TAB_ENTRY="encrypted_backup /dev/nvme0n1p5 none"
echo "$CRYPT_TAB_ENTRY" | sudo tee -a /etc/crypttab

# Add an entry to /etc/crypttab to automatically unlock the encrypted partition during boot
FSTAB_ENTRY="/dev/mapper/encrypted_backup $MOUNT_POINT btrfs defaults 0 0"
echo "$FSTAB_ENTRY" | sudo tee -a /etc/fstab

# Optionally, set permissions on the mount point to allow regular users to access it
sudo chmod 777 "$MOUNT_POINT"
# Replace oyinbra:oyinbra with your own username
sudo chown -R oyinbra:oyinbra "$MOUNT_POINT"

# -----------------------------------------
# Done
# -----------------------------------------
cat << "EOF"
 ____   ___  _   _ _____
|  _ \ / _ \| \ | | ____|
| | | | | | |  \| |  _|
| |_| | |_| | |\  | |___
|____/ \___/|_| \_|_____|

EOF
