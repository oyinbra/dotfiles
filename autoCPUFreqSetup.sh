#!/bin/bash

cat << "EOF"

 █████╗ ██╗   ██╗████████╗ ██████╗  ██████╗██████╗ ██╗   ██╗      ███████╗
██╔══██╗██║   ██║╚══██╔══╝██╔═══██╗██╔════╝██╔══██╗██║   ██║      ██╔════╝
███████║██║   ██║   ██║   ██║   ██║██║     ██████╔╝██║   ██║█████╗█████╗
██╔══██║██║   ██║   ██║   ██║   ██║██║     ██╔═══╝ ██║   ██║╚════╝██╔══╝
██║  ██║╚██████╔╝   ██║   ╚██████╔╝╚██████╗██║     ╚██████╔╝      ██║
╚═╝  ╚═╝ ╚═════╝    ╚═╝    ╚═════╝  ╚═════╝╚═╝      ╚═════╝       ╚═╝ 

EOF

# ------------------------------------------------------
# Check and create ~/Tmp directory
# ------------------------------------------------------
TMP_DIR="$HOME/Tmp"
if [ ! -d "$TMP_DIR" ]; then
  mkdir "$TMP_DIR"
fi

# ------------------------------------------------------
# Backup old version
# ------------------------------------------------------
if [ -d "$TMP_DIR/auto-cpufreq/" ]; then
  mv "$TMP_DIR/auto-cpufreq/" "$TMP_DIR/auto-cpufreq.bak"
fi

# ------------------------------------------------------
# Clone the auto-cpufreq repo
# ------------------------------------------------------
git clone "https://github.com/AdnanHodzic/auto-cpufreq.git" "$TMP_DIR/auto-cpufreq"

# ------------------------------------------------------
# Change Directory to auto-cpufreq
# ------------------------------------------------------
cd "$TMP_DIR/auto-cpufreq"

# ------------------------------------------------------
# Install auto-cpufreq
# ------------------------------------------------------
sudo ./auto-cpufreq-installer

# ------------------------------------------------------
# Enable auto-cpufreq daemon
# ------------------------------------------------------
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
