#!/bin/bash

# Fast setup to auto-suspend after 5 minutes on battery if idle
# With Notification Warning
# Arch Linux - Full Auto

# Step 1: Install required tools
echo "Installing xprintidle and libnotify..."
sudo pacman -S --noconfirm xprintidle libnotify

# Step 2: Create suspend-if-idle.sh
echo "Creating /usr/local/bin/suspend-if-idle.sh..."
sudo mkdir -p /usr/local/bin
sudo tee /usr/local/bin/suspend-if-idle.sh > /dev/null << 'EOF'
#!/bin/bash

IDLE_TIME=300
idle=$(xprintidle)

if [ "$idle" -ge $((IDLE_TIME * 1000)) ]; then
    notify-send "⚡ Warning" "Laptop will suspend in 30 seconds unless you move the mouse or keyboard!"
    sleep 30
    idle_after_warning=$(xprintidle)
    if [ "$idle_after_warning" -ge $((IDLE_TIME * 1000)) ]; then
        systemctl suspend
    else
        echo "User became active. Cancel suspend."
    fi
else
    echo "User active. Skipping suspend."
fi
EOF

# Make the script executable
sudo chmod +x /usr/local/bin/suspend-if-idle.sh

# Step 3: Create systemd service
echo "Creating systemd service..."
sudo tee /etc/systemd/system/power-disconnect-suspend.service > /dev/null << 'EOF'
[Unit]
Description=Run suspend-if-idle.sh after power disconnect
After=suspend.target

[Service]
Type=oneshot
ExecStart=/usr/local/bin/suspend-if-idle.sh
EOF

# Step 4: Create systemd timer
echo "Creating systemd timer..."
sudo tee /etc/systemd/system/power-disconnect-suspend.timer > /dev/null << 'EOF'
[Unit]
Description=Timer to run suspend-if-idle after 5 minutes on battery

[Timer]
OnActiveSec=5min
AccuracySec=30s
Unit=power-disconnect-suspend.service

[Install]
WantedBy=multi-user.target
EOF

# Step 5: Create udev rule
echo "Creating udev rule for AC unplug detection..."
sudo tee /etc/udev/rules.d/99-power-unplug-suspend.rules > /dev/null << 'EOF'
SUBSYSTEM=="power_supply", ATTR{online}=="0", RUN+="/bin/systemctl start power-disconnect-suspend.timer"
SUBSYSTEM=="power_supply", ATTR{online}=="1", RUN+="/bin/systemctl stop power-disconnect-suspend.timer"
EOF

# Step 6: Reload systemd and udev
echo "Reloading systemd and udev rules..."
sudo systemctl daemon-reload
sudo udevadm control --reload
sudo udevadm trigger

# Step 7: Enable timer at boot
echo "Enabling suspend timer at boot..."
sudo systemctl enable power-disconnect-suspend.timer

echo "✅ Setup complete! Unplug charger to test."
