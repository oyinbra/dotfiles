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
sudo pacman -Sy --noconfirm --needed latte-dock zsh neovim zoxide ksysguard kitty firewalld kdeconnect cronie git

# Add backup partition to fstab
echo "/dev/nvme0n1p4                            /Backup        btrfs   defaults                 0 0" | sudo tee --append /etc/fstab

# Enable and configure firewalld
sudo systemctl enable --now firewalld
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
ln -sf "$HOME/Dotfiles/aurorae" "$HOME/.local/share/"

# Create symbolic links for other configurations
ln -sf "$HOME/Dotfiles/.config/alacritty" "$HOME/.config"
rm -rf "$HOME/.config/kitty"
ln -sf "$HOME/Dotfiles/.config/kitty" "$HOME/.config"
ln -sf "$HOME/Workspace/nvim" "$HOME/.config"

# Create symbolic links for local share
ln -sf "$HOME/Dotfiles/.local/share/color-schemes" "$HOME/.local/share"
ln -sf "$HOME/Dotfiles/.local/share/icons" "$HOME/.local/share"
ln -sf "$HOME/Dotfiles/.local/share/plasma" "$HOME/.local/share"
mv "$HOME/.local/share/konsole" "$HOME/.local/share/konsole.bak"
ln -sf "$HOME/Dotfiles/.local/share/konsole/" "$HOME/.local/share/"

echo "
#############################################################################
#############################################################################
##                                                                         ##
##                     ZSH SHELL CONFIGURATION FOR ROOT                    ##
##                                                                         ##
#############################################################################
#############################################################################"

# Create symbolic links for root's shell configurations
sudo ln -sf "$HOME/Workspace/nvim" "/root/.config/"
sudo ln -sf "$HOME/Dotfiles/usr/share/sddm/themes/Ocean" "/usr/share/sddm/themes/"
sudo ln -sf "$HOME/Dotfiles/.config/zsh/.zshrc" "/root"
sudo ln -sf "$HOME/Dotfiles/p10k-root/.p10k.zsh" "/root/"
sudo ln -sf "$HOME/Dotfiles/.config/zsh" "/root/.config"
sudo ln -sf "$HOME/Dotfiles/neofetch-source/.neofetch-config2.conf" "/root/.config"
sudo ln -sf "$HOME/.zshenv" "/root"
sudo mkdir -p "/root/.local/share"
sudo rm -rf "/root/.local/share/nvim"
sudo ln -sf "$HOME/.local/share/nvim" "/root/.local/share/"
sudo ln -sf "$HOME/Dotfiles/neofetch-source/.neofetch-config2.conf" "/root"
sudo ln -sf "$HOME/Dotfiles/neofetch-ascii/usr/bin/neofetch" "/usr/bin"

# Enable auto-cpufreq
sudo ln -sf "$HOME/Dotfiles/auto-cpufreq/etc/auto-cpufreq.conf" "/etc"
echo "RebootWatchdogSec=0" | sudo tee --append "/etc/systemd/system.conf"
echo "vm.swappiness=10" | sudo tee --append "/etc/sysctl.conf"

# Enable crontab
sudo systemctl enable --now cronie.service

# Change shell for root and user
sudo chsh -s /bin/zsh root
chsh -s /bin/zsh "$USER"

# Install auto-cpufreq
if [ ! -d "$HOME/Tmp/auto-cpufreq/" ]; then
  git clone "https://github.com/AdnanHodzic/auto-cpufreq.git" "$HOME/Tmp/auto-cpufreq"
fi
sudo "$HOME/Tmp/auto-cpufreq/auto-cpufreq-installer"

sudo ln -sf "$HOME/Dotfiles/etc/paru.conf" "/etc/"

# Install Paru
sudo pacman -Sy --needed base-devel
mkdir -p "$HOME/Tmp"
if [ ! -d "$HOME/Tmp/paru/" ]; then
  git clone "https://aur.archlinux.org/paru.git" "$HOME/Tmp/paru/"
fi
cd "$HOME/Tmp/paru/"
makepkg -si

# Install yay
if [ ! -d "$HOME/Tmp/yay/" ]; then
  git clone "https://aur.archlinux.org/yay.git" "$HOME/Tmp/yay/"
fi
cd "$HOME/Tmp/yay/"
makepkg -si

# Update grub themes
if [ ! -d "$HOME/Tmp/grub2-themes/" ]; then
  git clone "https://github.com/vinceliuice/grub2-themes.git" "$HOME/Tmp/grub2-themes/"
fi
cd ""
sudo $HOME/Tmp/grub2-themes/install.sh -b -t tela

# Install Arcolinux and Chaotic repos
$HOME/Dotfiles/arcolinux-chaotic-repo.sh

# Install custom packages
cd "$HOME/Dotfiles/"
sudo pacman -S --needed - < "$HOME/Dotfiles/packages-arch.txt"
