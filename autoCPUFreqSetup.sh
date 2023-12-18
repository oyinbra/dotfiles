#!/bin/bash

cat << "EOF"

███ █ █ ███ ███   ███ ███ █ █     ███ ███ ███ ███
█ █ █ █  █  █ █   █   █ █ █ █     █   █ █ █   █ █
█ █ █ █  █  █ █   █   ███ █ █ ███ ███ ██  ███ █ █
███ █ █  █  █ █   █   █   █ █     █   █ █ █   ███
█ █ ███  █  ███   ███ █   ███     █   █ █ ███ ███
                                                █
EOF

# ------------------------------------------------------
# Check and create ~/Tmp directory
# ------------------------------------------------------
TMP_DIR="$HOME/Tmp"
if [ ! -d "$TMP_DIR" ]; then
  mkdir "$TMP_DIR"
fi

# ------------------------------------------------------
# Change Directory to auto-cpufreq if exists
# Update the old version if available
# ------------------------------------------------------
if [ -d "$TMP_DIR/auto-cpufreq/" ]; then
  cd "$TMP_DIR/auto-cpufreq"
  git pull origin master  # Update the existing version
else
  # ------------------------------------------------------
  # Clone the auto-cpufreq repo
  # ------------------------------------------------------
  git clone "https://github.com/AdnanHodzic/auto-cpufreq.git" "$TMP_DIR/auto-cpufreq"
  cd "$TMP_DIR/auto-cpufreq"
fi

# ------------------------------------------------------
# Install auto-cpufreq
# ------------------------------------------------------
cat << "EOF"
▄▖▖ ▖▄▖▄▖▄▖▖ ▖   ▄▖▖▖▄▖▄▖  ▄▖▄▖▖▖  ▄▖▄▖▄▖▄▖▄▖
▐ ▛▖▌▚ ▐ ▌▌▌ ▌   ▌▌▌▌▐ ▌▌  ▌ ▙▌▌▌▄▖▙▖▙▘▙▖▌▌▗▘
▟▖▌▝▌▄▌▐ ▛▌▙▖▙▖  ▛▌▙▌▐ ▙▌  ▙▖▌ ▙▌  ▌ ▌▌▙▖█▌▗
                                          ▘
EOF
sudo ./auto-cpufreq-installer

# ------------------------------------------------------
# Enable auto-cpufreq daemon
# ------------------------------------------------------
cat << "EOF"
▄▖▖ ▖▄▖▄ ▖ ▄▖  ▄▖▖▖▄▖▄▖  ▄▖▄▖▖▖  ▄▖▄▖▄▖▄▖▄▖
▙▖▛▖▌▌▌▙▘▌ ▙▖  ▌▌▌▌▐ ▌▌  ▌ ▙▌▌▌▄▖▙▖▙▘▙▖▌▌▗▘
▙▖▌▝▌▛▌▙▘▙▖▙▖  ▛▌▙▌▐ ▙▌  ▙▖▌ ▙▌  ▌ ▌▌▙▖█▌▗
                                        ▘
EOF
sudo auto-cpufreq --install

# ------------------------------------------------------
# Enable auto-cpufreq custom settings
# ------------------------------------------------------
CONFIG_FILE="$HOME/Dotfiles/etc/auto-cpufreq.conf"

if [ -e "$CONFIG_FILE" ]; then
  sudo ln -sTf "$CONFIG_FILE" "/etc/auto-cpufreq.conf"
else
  echo "Error: $CONFIG_FILE does not exist. Please create the configuration file first."
fi

