#!/bin/bash
# Setup systemd service and timer for daily backup

set -e

SCRIPT_PATH="$HOME/dotfiles/backup.sh"
SERVICE_PATH="/etc/systemd/system/backup.service"
TIMER_PATH="/etc/systemd/system/backup.timer"

if [[ ! -f "$SCRIPT_PATH" ]]; then
    echo "Backup script not found at $SCRIPT_PATH"
    exit 1
fi

echo "Setting executable permission on backup script..."
chmod +x "$SCRIPT_PATH"

echo "Creating systemd service file at $SERVICE_PATH..."
sudo tee "$SERVICE_PATH" > /dev/null <<EOF
[Unit]
Description=Daily Backup Service

[Service]
Type=oneshot
ExecStart=$SCRIPT_PATH
EOF

echo "Creating systemd timer file at $TIMER_PATH..."
sudo tee "$TIMER_PATH" > /dev/null <<EOF
[Unit]
Description=Run backup daily

[Timer]
OnCalendar=daily
Persistent=true

[Install]
WantedBy=timers.target
EOF

echo "Reloading systemd daemon..."
sudo systemctl daemon-reload

echo "Enabling and starting backup.timer..."
sudo systemctl enable --now backup.timer

echo "Setup complete. Backup will run daily."

