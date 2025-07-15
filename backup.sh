
#!/bin/bash

# File location: ~/dotfiles/backup.sh

set -euo pipefail
IFS=$'\n\t'

# ───────────────────────────────────────────────────────────────
# Config
# ───────────────────────────────────────────────────────────────
BACKUP_DIR="/backup"
RSYNC_FLAGS=(-aAXv --delete)
EXCLUDES=(
  "$HOME/.local/share/Trash/"
  "$HOME/Downloads/"
  "$HOME/.docker/"
)

SYSTEM_DIRS=(
  "/etc/pacman.d"
  "/var/spool/cron"
)

# ───────────────────────────────────────────────────────────────
# Exit if backup partition is not mounted
# ───────────────────────────────────────────────────────────────
if ! mountpoint -q "$BACKUP_DIR"; then
  echo "[✘] Backup directory $BACKUP_DIR is not mounted. Aborting."
  exit 1
fi

# ───────────────────────────────────────────────────────────────
# Stylized banner
# ───────────────────────────────────────────────────────────────
cat << "EOF"
▄▖▄▖▄▖▄▖▄▖  ▄▖▖▖▄▖  ▄ ▄▖▄▖▖▖▖▖▄▖
▚ ▐ ▌▌▙▘▐   ▚ ▌▌▚   ▙▘▌▌▌ ▙▘▌▌▙▌
▄▌▐ ▛▌▌▌▐   ▄▌▐ ▄▌  ▙▘▛▌▙▖▌▌▙▌▌
EOF

# ───────────────────────────────────────────────────────────────
# Ensure backup directory exists (redundant if mounted, safe if not)
# ───────────────────────────────────────────────────────────────
sudo mkdir -p "$BACKUP_DIR"

# ───────────────────────────────────────────────────────────────
# Build exclude arguments
# ───────────────────────────────────────────────────────────────
EXCLUDE_ARGS=()
for path in "${EXCLUDES[@]}"; do
  EXCLUDE_ARGS+=(--exclude="$path")
done

# ───────────────────────────────────────────────────────────────
# Backup home
# ───────────────────────────────────────────────────────────────
echo "[+] Backing up /home → $BACKUP_DIR"
sudo rsync "${RSYNC_FLAGS[@]}" "${EXCLUDE_ARGS[@]}" /home "$BACKUP_DIR"

# ───────────────────────────────────────────────────────────────
# Backup system dirs
# ───────────────────────────────────────────────────────────────
for dir in "${SYSTEM_DIRS[@]}"; do
  echo "[+] Backing up $dir → $BACKUP_DIR"
  sudo rsync "${RSYNC_FLAGS[@]}" "$dir" "$BACKUP_DIR"
done

# ───────────────────────────────────────────────────────────────
# Footer
# ───────────────────────────────────────────────────────────────
cat << "EOF"

██  ███ █   █ ███
█ █ █ █ ██  █ █
█ █ █ █ █ █ █ ███
█ █ █ █ █  ██ █
██  ███ █   █ ███

Backup completed successfully.
EOF
