#!/bin/bash

echo "
#############################################################################
#############################################################################
##                                                                         ##
##                     AUTO CPU Frequency Installation                     ##
##                                                                         ##
#############################################################################
#############################################################################"

# Install auto-cpufreq
if [ ! -d "$HOME/Tmp/auto-cpufreq/" ]; then
  git clone "https://github.com/AdnanHodzic/auto-cpufreq.git" "$HOME/Tmp/auto-cpufreq"
fi
sudo "$HOME/Tmp/auto-cpufreq/auto-cpufreq-installer"
# Enable auto-cpufreq daemon
sudo auto-cpufreq --install
# Enable auto-cpufreq custom settings
sudo ln -sf "$HOME/Dotfiles/auto-cpufreq/etc/auto-cpufreq.conf" "/etc"
