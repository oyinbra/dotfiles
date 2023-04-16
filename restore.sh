echo "
#############################################################################
#############################################################################
##                                                                         ##
##                        KDE PLASMA RESTORE SCRIPT                        ##
##                                                                         ##
#############################################################################
#############################################################################"

# Sync packages
sudo pacman -Sy archlinux-keyring zoxide latte-dock neovim ksysguard zsh auto-cpufreq

sudo systemctl enable --now firewalld
sudo firewall-cmd --state
sudo ufw disable
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --reload
sudo firewall-cmd --list-services

# Restore Backup
rsync -aAXv --delete /run/media/$USER/Backup/home/$USER /home/
mkdir /home/$USER/Downloads
echo 'XDG_DOWNLOAD_DIR="$HOME/Downloads"' >> ~/.config/user-dirs.dirs
# Add backup partition to fstab
echo "/dev/nvme0n1p4                            /Backup        btrfs   defaults                 0 0" | sudo tee --append /etc/fstab
# Restore pkg backup
sudo rsync -aAXv /run/media/$USER/Backup/pkg/. /var/cache/pacman/pkg
# sudo rsync -aAXv /Backup/pkg/. /var/cache/pacman/pkg

# zsh shell configurations
ln -sf ~/Dotfiles/zplug ~/.zplug
ln -sf ~/Dotfiles/.config/zsh/.zshrc ~/
ln -sf ~/Dotfiles/.config/zsh ~/.config/
ln -sf ~/Dotfiles/p10k-user/.p10k.zsh ~/
ln -sf ~/Dotfiles/neofetch-source/.neofetch-config2.conf ~/
# latte-dock
ln -sf ~/Dotfiles/latte-dock/.config/lattedockrc ~/.config/
ln -sf ~/Dotfiles/latte-dock/.config/latte ~/.config
ln -sf ~/Dotfiles/git/.gitignore_global ~/
ln -sf ~/Dotfiles/icons/.icons ~/
ln -sf ~/Dotfiles/aurorae ~/.local/share/

# CONFIGURATIONS
ln -sf ~/Dotfiles/.config/alacritty ~/.config
rm -rf /home/$USER/.config/kitty
ln -sf ~/Dotfiles/.config/kitty ~/.config
ln -sf ~/Workspace/nvim ~/.config

# LOCAL SHARE
ln -sf ~/Dotfiles/.local/share/color-schemes ~/.local/share
ln -sf ~/Dotfiles/.local/share/icons ~/.local/share
ln -sf ~/Dotfiles/.local/share/plasma ~/.local/share
# Backup konsole folder
mv ~/.local/share/konsole ~/.local/share/konsole.bak
ln -sf ~/Dotfiles/.local/share/konsole/ ~/.local/share/

# SDDM Themes
sudo ln -sf ~/Dotfiles/usr/share/sddm/themes/Ocean /usr/share/sddm/themes/
# Neovim config
sudo ln -sf /home/$USER/Workspace/nvim /root/.config/
# Paru config
sudo ln -sf /home/$USER/Dotfiles/etc/paru.conf /etc/

echo "
#############################################################################
#############################################################################
##                                                                         ##
##                     ZSH SHELL CONFIGURATION FOR ROOT                    ##
##                                                                         ##
#############################################################################
#############################################################################"

sudo ln -sf /home/$USER/Dotfiles/.config/zsh/.zshrc /root
sudo ln -sf /home/$USER/Dotfiles/p10k-root/.p10k.zsh /root/
sudo ln -sf /home/$USER/Dotfiles/.config/zsh /root/.config
sudo ln -sf /home/$USER/Dotfiles/neofetch-source/.neofetch-config2.conf /root/.config
sudo ln -sf /home/$USER/.zshenv /root
sudo ln -sf /home/$USER/.local/share/nvim /root/.local/share/
sudo ln -sf /home/$USER/Dotfiles/neofetch-source/.neofetch-config2.conf /root
sudo ln -sf /home/$USER/Dotfiles/neofetch-ascii/usr/bin/neofetch /usr/bin

# enable auto-cpufreq
sudo systemctl enable --now auto-cpufreq.service
sudo systemctl mask power-profiles-daemon.service
sudo ln -sf /home/$USER/Dotfiles/auto-cpufreq/etc/auto-cpufreq.conf /etc
# stop the no watchdog message on reboot
echo "RebootWatchdogSec=0" | sudo tee --append /etc/systemd/system.conf
sudo systemctl enable --now cronie.service

echo "DONE"
echo "Refresh zshrc"
source ~/.zshrc

