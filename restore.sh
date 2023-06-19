echo "
#############################################################################
#############################################################################
##                                                                         ##
##                        KDE PLASMA RESTORE SCRIPT                        ##
##                                                                         ##
#############################################################################
#############################################################################"

# Restore pkg backup
sudo rsync -aAXv --ignore-times /run/media/$USER/Backup/pkg/. /var/cache/pacman/pkg

# Sync and install required packages
sudo pacman -Sy latte-dock zsh neovim zoxide ksysguard kitty firewalld kdeconnect cronie git --noconfirm --needed
# Restore Backup
rsync -aAXv --ignore-times /run/media/$USER/Backup/home/$USER /home/

# Add backup partition to fstab
echo "/dev/nvme0n1p4                            /Backup        btrfs   defaults                 0 0" | sudo tee --append /etc/fstab
# echo "Defaults timestamp_timeout=120" | sudo tee --append /etc/sudoers.tmp
# echo "Defaults timestamp_timeout=120" | sudo tee --append /etc/sudoers.d/10-installer.tmp

sudo systemctl enable --now firewalld
sudo firewall-cmd --state
sudo ufw disable
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --reload
sudo firewall-cmd --list-services

# firewalld plus KDE setup
sudo firewall-cmd --permanent --zone=public --add-service=kdeconnect
sudo firewall-cmd --reload

# zsh shell configurations
ln -sf ~/Dotfiles/zplug ~/.zplug
ln -sf ~/Dotfiles/.config/zsh/.zshrc ~/
ln -sf ~/Dotfiles/.config/zsh ~/.config/
ln -sf ~/Dotfiles/p10k-user/.p10k.zsh ~/
ln -sf ~/Dotfiles/neofetch-source/.neofetch-config2.conf ~/
# latte-dock
ln -sf ~/Dotfiles/.config/lattedockrc ~/.config
ln -sf ~/Dotfiles/.config/latte ~/.config
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

echo "
#############################################################################
#############################################################################
##                                                                         ##
##                     ZSH SHELL CONFIGURATION FOR ROOT                    ##
##                                                                         ##
#############################################################################
#############################################################################"

sudo ln -sf /home/$USER/Dotfiles/etc/paru.conf /etc/
sudo ln -sf /home/$USER/Workspace/nvim /root/.config/
sudo ln -sf ~/Dotfiles/usr/share/sddm/themes/Ocean /usr/share/sddm/themes/
sudo ln -sf /home/$USER/Dotfiles/.config/zsh/.zshrc /root
sudo ln -sf /home/$USER/Dotfiles/p10k-root/.p10k.zsh /root/
sudo ln -sf /home/$USER/Dotfiles/.config/zsh /root/.config
sudo ln -sf /home/$USER/Dotfiles/neofetch-source/.neofetch-config2.conf /root/.config
sudo ln -sf /home/$USER/.zshenv /root
sudo mkdir -p /root/.local/share
sudo rm -rf /root/.local/share/nvim
sudo ln -sf /home/$USER/.local/share/nvim /root/.local/share/
sudo ln -sf /home/$USER/Dotfiles/neofetch-source/.neofetch-config2.conf /root
sudo ln -sf /home/$USER/Dotfiles/neofetch-ascii/usr/bin/neofetch /usr/bin

# enable auto-cpufreq
sudo systemctl mask power-profiles-daemon.service
sudo ln -sf /home/$USER/Dotfiles/auto-cpufreq/etc/auto-cpufreq.conf /etc
# stop the no watchdog message on reboot
echo "RebootWatchdogSec=0" | sudo tee --append /etc/systemd/system.conf
sudo systemctl enable --now cronie.service

echo "DONE"
echo "Source zshrc"
source ~/.zshrc
loginctl terminate-user $USER
