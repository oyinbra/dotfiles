#!/bin/bash

cat << "EOF"

███████╗██╗   ██╗███╗   ███╗██╗     ██╗███╗   ██╗██╗  ██╗███████╗
██╔════╝╚██╗ ██╔╝████╗ ████║██║     ██║████╗  ██║██║ ██╔╝██╔════╝
███████╗ ╚████╔╝ ██╔████╔██║██║     ██║██╔██╗ ██║█████╔╝ ███████╗
╚════██║  ╚██╔╝  ██║╚██╔╝██║██║     ██║██║╚██╗██║██╔═██╗ ╚════██║
███████║   ██║   ██║ ╚═╝ ██║███████╗██║██║ ╚████║██║  ██╗███████║
╚══════╝   ╚═╝   ╚═╝     ╚═╝╚══════╝╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝

EOF

# ------------------------------------------------------
# RESTORE SYSTEM CONFIGURATIONS
# ------------------------------------------------------

cat << "EOF"

██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗
██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║
██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║
██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║
██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗
╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝

EOF

# ------------------------------------------------------
# Install mechvibes
# ------------------------------------------------------
sudo pacman -U /var/cache/pacman/pkg/mechvibes-2.3.0-1-x86_64.pkg.tar.zst

# ------------------------------------------------------
# Install required packages
# ------------------------------------------------------
sudo pacman -S firewalld || { echo "Package installation failed"}

# ------------------------------------------------------
# Enable and configure firewalld
# ------------------------------------------------------
sudo systemctl enable --now firewalld
sudo systemctl start firewalld
sudo firewall-cmd --state
sudo ufw disable
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --reload
sudo firewall-cmd --list-services
sudo firewall-cmd --permanent --zone=public --add-service=kdeconnect
sudo firewall-cmd --reload

# ------------------------------------------------------
# Create symbolic links for git, icons, and aurorae
# ------------------------------------------------------
ln -sTf "$HOME/Dotfiles/git/.gitignore_global" "$HOME/.gitignore_global"

# ------------------------------------------------------
# Cursors
# ------------------------------------------------------
# ln -sf "$HOME/Dotfiles/cursors/.icons" "$HOME/"

# ------------------------------------------------------
# Create symbolic links for latte-dock
# ------------------------------------------------------
# ln -sf "$HOME/Dotfiles/.config/lattedockrc" "$HOME/.config"
# ln -sf "$HOME/Dotfiles/.config/latte" "$HOME/.config"

# ------------------------------------------------------
# Create symbolic links for other configurations
# ------------------------------------------------------
ln -sTf "$HOME/Dotfiles/.config/alacritty" "$HOME/.config/alacritty"
rm -rf "$HOME/.config/kitty"
ln -sTf "$HOME/Dotfiles/.config/kitty" "$HOME/.config/kitty"
ln -sTf "$HOME/Dotfiles/.config/mpv" "$HOME/.config/mpv"
ln -sTf "$HOME/Workspace/Projects/nvim" "$HOME/.config/nvim"
ln -sTf "$HOME/Dotfiles/.config/autostart" "$HOME/.config/autostart"
ln -sTf "$HOME/Dotfiles/sxhkd" "$HOME/.config/sxhkd"
ln -sTf "$HOME/Dotfiles/rofi" "$HOME/.config/rofi"
# ------------------------------------------------------
# Root
# ------------------------------------------------------
sudo lTn -sf "$HOME/.env" "/root"
sudo mkdir -p "/root/.local/share"
sudo rm -rf "/root/.local/share/nvim"
sudo ln -sf "$HOME/.local/share/nvim" "/root/.local/share/nvim"

# ------------------------------------------------------
# Stop reboot watchdog on boot
# ------------------------------------------------------
echo "RebootWatchdogSec=0" | sudo tee --append "/etc/systemd/system.conf"

# ------------------------------------------------------
# Reduce swappiness to 10
# ------------------------------------------------------
echo "vm.swappiness=10" | sudo tee --append "/etc/sysctl.d/99-swappiness.conf"

# ------------------------------------------------------
# Reload the sysctl configuration
# ------------------------------------------------------
sudo systemctl daemon-reload

# ------------------------------------------------------
# Enable crontab
# ------------------------------------------------------
sudo systemctl enable --now cronie.service
