#!/bin/bash
echo "
#############################################################################
#############################################################################
##                                                                         ##
##                        KDE PLASMA RESTORE SCRIPT                        ##
##                                                                         ##
#############################################################################
#############################################################################"

# Sync and install required packages
# sudo pacman -Sy --noconfirm --needed latte-dock zsh neovim zoxide ksysguard kitty firewalld kdeconnect cronie git

# Install mechvibes
sudo pacman -U --noconfirm /var/cache/pacman/pkg/mechvibes-2.3.0-1-x86_64.pkg.tar.zst

# Enable and configure firewalld
sudo systemctl enable --now firewalld
sudo systemctl start firewalld
sudo firewall-cmd --state
sudo ufw disable
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --reload
sudo firewall-cmd --list-services
sudo firewall-cmd --permanent --zone=public --add-service=kdeconnect
sudo firewall-cmd --reload

# Create symbolic links for zsh shell configurations
ln -sf "$HOME/Dotfiles/zplug" "$HOME/.zplug"
ln -sf "$HOME/Dotfiles/.config/zsh/.zshrc" "$HOME/"
ln -sf "$HOME/Dotfiles/.config/zsh" "$HOME/.config/"
ln -sf "$HOME/Dotfiles/p10k-user/.p10k.zsh" "$HOME/"
ln -sf "$HOME/Dotfiles/neofetch-source/.neofetch-config2.conf" "$HOME/"

# Create symbolic links for latte-dock
ln -sf "$HOME/Dotfiles/.config/lattedockrc" "$HOME/.config"
ln -sf "$HOME/Dotfiles/.config/latte" "$HOME/.config"

# Create symbolic links for git, icons, and aurorae
ln -sf "$HOME/Dotfiles/git/.gitignore_global" "$HOME/"
ln -sf "$HOME/Dotfiles/icons/.icons" "$HOME/"

# Create symbolic links for other configurations
ln -sf "$HOME/Dotfiles/.config/alacritty" "$HOME/.config"
rm -rf "$HOME/.config/kitty"
ln -sf "$HOME/Dotfiles/.config/kitty" "$HOME/.config"
ln -sf "$HOME/Dotfiles/.config/mpv" "$HOME/.config"
ln -sf "$HOME/Workspace/Projects/nvim" "$HOME/.config"

echo "
#############################################################################
#############################################################################
##                                                                         ##
##                     ZSH SHELL CONFIGURATION FOR ROOT                    ##
##                                                                         ##
#############################################################################
#############################################################################"

# Create symbolic links for root's shell configurations
sudo ln -sf "$HOME/Dotfiles/.config/zsh/.zshrc" "/root"
sudo ln -sf "$HOME/Dotfiles/p10k-root/.p10k.zsh" "/root/"
sudo ln -sf "$HOME/Dotfiles/.config/zsh" "/root/.config"
sudo ln -sf "$HOME/Dotfiles/neofetch-source/.neofetch-config2.conf" "/root/.config"
sudo ln -sf "$HOME/.env" "/root"
sudo mkdir -p "/root/.local/share"
sudo rm -rf "/root/.local/share/nvim"
sudo ln -sf "$HOME/.local/share/nvim" "/root/.local/share/"
sudo ln -sf "$HOME/Dotfiles/neofetch-source/.neofetch-config2.conf" "/root"
sudo ln -sf "$HOME/Dotfiles/neofetch-ascii/usr/bin/neofetch" "/usr/bin"

# Stop reboot watchdog on boot
echo "RebootWatchdogSec=0" | sudo tee --append "/etc/systemd/system.conf"
# Reduce swappiness to 10
echo "vm.swappiness=10" | sudo tee --append "/etc/sysctl.conf"
echo "vm.swappiness=10" | sudo tee --append "/etc/sysctl.d/100-manjaro.conf"

# Enable crontab
sudo systemctl enable --now cronie.service

# Change shell for root and user
sudo chsh -s /bin/zsh root
chsh -s /bin/zsh "$USER"

# Update grub themes
if [ ! -d "$HOME/Tmp/grub2-themes/" ]; then
  git clone "https://github.com/vinceliuice/grub2-themes.git" "$HOME/Tmp/grub2-themes/"
fi
cd ""
# sudo $HOME/Tmp/grub2-themes/install.sh -b -t tela
