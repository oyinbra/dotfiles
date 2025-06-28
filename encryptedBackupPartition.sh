#!/bin/bash
set -euo pipefail

# -------------------------
# Fancy ASCII Header
# -------------------------
cat << "EOF"
 _____                             _           _
| ____|_ __   ___ _ __ _   _ _ __ | |_ ___  __| |
|  _| | '_ \ / __| '__| | | | '_ \| __/ _ \/ _` |
| |___| | | | (__| |  | |_| | |_) | ||  __/ (_| |
|_____|_| |_|\___|_|   \__, | .__/ \__\___|\__,_|
                       |___/|_|
EOF

# -------------------------
# Config
# -------------------------
DEVICE="/dev/nvme0n1p5"
MAPPER_NAME="encrypted_backup"
MOUNT_POINT="/backup"
CRYPTTAB="/etc/crypttab"
FSTAB="/etc/fstab"
USERNAME="oyinbra"
GROUPNAME="oyinbra"

# -------------------------
# Ensure mount point exists
# -------------------------
sudo mkdir -p "$MOUNT_POINT"

# -------------------------
# Append to /etc/crypttab if not already present
# -------------------------
CRYPT_ENTRY="$MAPPER_NAME $DEVICE none"
if ! grep -q "^$CRYPT_ENTRY" "$CRYPTTAB"; then
  echo "$CRYPT_ENTRY" | sudo tee -a "$CRYPTTAB" > /dev/null
fi

# -------------------------
# Append to /etc/fstab if not already present
# -------------------------
FSTAB_ENTRY="/dev/mapper/$MAPPER_NAME $MOUNT_POINT btrfs defaults 0 0"
if ! grep -q "^/dev/mapper/$MAPPER_NAME " "$FSTAB"; then
  echo "$FSTAB_ENTRY" | sudo tee -a "$FSTAB" > /dev/null
fi

# -------------------------
# Permissions
# -------------------------
sudo chown -R "$USERNAME:$GROUPNAME" "$MOUNT_POINT"
sudo chmod 755 "$MOUNT_POINT"

# -------------------------
# Done
# -------------------------
cat << "EOF"
 ____   ___  _   _ _____
|  _ \ / _ \| \ | | ____|
| | | | | | |  \| |  _|
| |_| | |_| | |\  | |___
|____/ \___/|_| \_|_____|
EOF