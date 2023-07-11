#!/bin/bash

# Install Paru
sudo pacman -Sy --needed base-devel
mkdir -p "$HOME/Tmp"
if [ ! -d "$HOME/Tmp/paru/" ]; then
  git clone "https://aur.archlinux.org/paru.git" "$HOME/Tmp/paru/"
fi
cd "$HOME/Tmp/paru/"
makepkg -si
# Paru configurations
sudo ln -sf "$HOME/Dotfiles/etc/paru.conf" "/etc/"

# Install yay
if [ ! -d "$HOME/Tmp/yay/" ]; then
  git clone "https://aur.archlinux.org/yay.git" "$HOME/Tmp/yay/"
fi
cd "$HOME/Tmp/yay/"
makepkg -si

# Install auto-cpufreq
if [ ! -d "$HOME/Tmp/auto-cpufreq/" ]; then
  git clone "https://github.com/AdnanHodzic/auto-cpufreq.git" "$HOME/Tmp/auto-cpufreq"
fi
sudo "$HOME/Tmp/auto-cpufreq/auto-cpufreq-installer"
# Enable auto-cpufreq daemon
sudo auto-cpufreq --install
# Enable auto-cpufreq custom settings
sudo ln -sf "$HOME/Dotfiles/auto-cpufreq/etc/auto-cpufreq.conf" "/etc"

# Install other packages and enable preload
paru -Sy preload tradingview
systemctl enable --now preload.service
