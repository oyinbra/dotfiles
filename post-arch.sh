# POST ARCH INSTALL SCRIPT

# ##############################################
# ################## ARCH Pure  ###############
# ##############################################

echo Cloning zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k


# ##############################################
# #################### ARCH ####################
# ##############################################

ln -sf ~/.dotfiles/zshrc/.zshrc ~/
ln -sf ~/.dotfiles/powerlevel10k/.p10k.zsh ~/
ln -sf ~/.dotfiles/zsh_aliases/.zsh_aliases ~/

ln -sf ~/.dotfiles/latte-dock/.config/lattedockrc ~/.config/
ln -sf ~/.dotfiles/latte-dock/.config/latte ~/.config
ln -sf ~/.dotfiles/fonts/.fonts ~/
ln -sf ~/.dotfiles/git/.gitignore_global ~/
ln -sf ~/.dotfiles/icons/.icons ~/
ln -sf ~/.dotfiles/neofetch-source/.neofetch-config2.conf ~/
ln -sf ~/.dotfiles/themes/.themes ~/
ln -sf ~/.dotfiles/tmux/.tmux.conf ~/
ln -sf ~/.dotfiles/alacritty/.config/alacritty ~/.config
ln -sf ~/.dotfiles/aurorae ~/.local/share/
sudo ln -sf ~/.dotfiles/zsh_aliases/.zsh_aliases /root/

# CONFIGURATIONS
ln -sf ~/.dotfiles/.config/obs-studio ~/.config
ln -sf ~/.dotfiles/.config/fluent-reader ~/.config
ln -sf ~/.dotfiles/.config/VirtualBox ~/.config

# LOCAL SHARE
ln -sf ~/.dotfiles/.local/share/color-schemes ~/.local/share
ln -sf ~/.dotfiles/.local/share/icons ~/.local/share
ln -sf ~/.dotfiles/.local/share/plasma ~/.local/share
# Remove konsole folder
mv ~/.local/share/konsole ~/.local/share/konsole.bak
ln -sf ~/.dotfiles/.local/share/konsole/ ~/.local/share/

# SDDM Themes
sudo ln -sf ~/.dotfiles/usr/share/sddm/themes/Ocean /usr/share/sddm/themes/

echo "#############################################################################"
echo "#############################################################################"
echo "##                                                                         ##"
echo "##                     OH-MY-ZSH ROOT INSTALLATION                         ##"
echo "##                                                                         ##"
echo "#############################################################################"
echo "#############################################################################" 

# Copy oh=my=zsh to root
sudo cp -r /home/oyinbra/.oh-my-zsh /root
sudo ln -sf /home/oyinbra/.dotfiles/powerlevel10k-root/.p10k.zsh /root/
sudo ln -sf /home/oyinbra/.dotfiles/neofetch-source/.neofetch-config2.conf /root
sudo ln -sf /home/oyinbra/.dotfiles/neofetch-ascii/usr/bin/neofetch /usr/bin
sudo ln -sf /home/oyinbra/.dotfiles/zshrc/.zshrc /root

# Enable color in nano editor for root user (Comment for Manjaro)
# sudo ln -sf /home/oyinbra/.dotfiles/home/.nanorc /root
# ln -sf ~/.dotfiles/nano/.nanorc ~/
ln -sf ~/.dotfiles/home/.nanorc ~/

echo Refrsh zshrc
source ~/.zshrc

echo ###############################################################################
echo ###############################################################################
echo ##                                                                           ## 
echo ##                      Mirror Installation                                  ##
echo ##                                                                           ##
echo ###############################################################################
echo ###############################################################################

# Arch mirror list
# sudo ln -sf ~/.dotfiles/etc/pacman.d/mirrorlist /etc/pacman.d

# echo Enable color in nano editor for user

# echo Arcolinux Mirror
# sudo ln -sf ~/.dotfiles/etc/pacman.d/arcolinux-mirrorlist /etc/pacman.d

# echo Pacman configuration
# sudo ln -sf ~/.dotfiles/etc/pacman.conf /etc

# echo Paru configuration
# sudo ln -sf ~/.dotfiles/etc/paru.conf /etc/


####################################################################################
####################################################################################
##                                                                                ## 
##                          Package Installation                                  ##
##                                                                                ##
####################################################################################
####################################################################################

# sudo pacman -Sy --noconfirm --needed latte-dock alacritty obs-studio gparted

# sudo pacman -U obs-studio-28.1.2-2-x86_64.pkg.tar.zst brave-bin-1_1.45.133-1-x86_64.pkg.tar.zst pycharm-community-edition-2022.2.4-1-x86_64.pkg.tar.zst android-studio-2021.3.1.17-1-x86_64.pkg.tar.zst discord-0.0.21-2-x86_64.pkg.tar.zst uget-2.2.3-6-x86_64.pkg.tar.zst fluent-reader-bin-1.1.3-1-x86_64.pkg.tar.zst mailspring-1.10.7-1-x86_64.pkg.tar.zst bitwarden-2022.11.0-1-x86_64.pkg.tar.zst motrix-bin-1.6.11-1.1-x86_64.pkg.tar.zst freedownloadmanager-6.18.1.4920-1-x86_64.pkg.tar.zst google-chrome-108.0.5359.71-1-x86_64.pkg.tar.zst notion-app-enhanced-2.0.18-1.1-x86_64.pkg.tar.zst rust-1_1.65.0-1-x86_64.pkg.tar.zst paru-1.11.1-1-x86_64.pkg.tar.zst duf-0.8.1-2-x86_64.pkg.tar.zst btop-1.2.13-1-x86_64.pkg.tar.zst ksysguard-5.22.0-1-x86_64.pkg.tar.zst telegram-desktop-4.3.4-1-x86_64.pkg.tar.zst alacritty-0.11.0-2-x86_64.pkg.tar.zst onlyoffice-bin-7.2.1-1.1-x86_64.pkg.tar.zst libreoffice-fresh-7.4.3-2-x86_64.pkg.tar.zst gthumb-3.12.2-1-x86_64.pkg.tar.zst clutter-1.26.4-2-x86_64.pkg.tar.zst imath-3.1.6-1-x86_64.pkg.tar.zst webkit2gtk-2.38.2-2-x86_64.pkg.tar.zst neovim-symlinks-5-1-any.pkg.tar.zst rate-mirrors-bin-0.11.1-1-x86_64.pkg.tar.zst bat-0.22.1-1-x86_64.pkg.tar.zst firewalld-1.2.1-1-any.pkg.tar.zst python-pyqt5-5.15.7-3-x86_64.pkg.tar.zst nethogs-git-v0.8.7.r16.g80df004-1-x86_64.pkg.tar.zst

# timeshift-bin-22.11.1-1-x86_64.pkg.tar.zst timeshift-autosnap-0.9-1-any.pkg.tar.zst


####################################################################################
####################################################################################
##                                                                                ## 
##                         POWER MANAGEMENT Installation                          ##
##                                                                                ##
####################################################################################
####################################################################################

# echo Autocpufreq
# sudo ln -sf ~/.dotfiles/etc/auto-cpufreq.conf /etc
# echo tlp
# sudo ln -sf ~/.dotfiles/etc/tlp.conf /etc


# Pictures Restore
#cd ~/Pictures
#git clone https://github.com/Oyinbra/Pictures.git
#cd Pictures
#cp -r Screenshots Wallpaper ~/Pictures
#cd ..
#rm -rf Pictures
