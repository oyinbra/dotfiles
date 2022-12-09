# POST ARCH INSTALL SCRIPT

sudo pacman -S zsh git wget curl neofetch && chsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k



cd
git clone https://github.com/Oyinbra/.dotfiles.git

ln -sf ~/.dotfiles/zshrc/.zshrc ~/
ln -sf ~/.dotfiles/powerlevel10k/.p10k.zsh ~/
ln -sf ~/.dotfiles/zsh_aliases/.zsh_aliases ~/
ln -sf ~/.dotfiles/konsole/.local/share/konsole/oyinbra.profile ~/.local/share/konsole
ln -sf ~/.dotfiles/latte-dock/.config/lattedockrc ~/.config/
ln -sf ~/.dotfiles/latte-dock/.config/latte ~/.config
ln -sf ~/.dotfiles/fonts/.fonts ~/
ln -sf ~/.dotfiles/git/.gitignore_global ~/
ln -sf ~/.dotfiles/icons/.icons ~/
ln -sf ~/.dotfiles/neofetch-source/.neofetch-config2.conf ~/
ln -sf ~/.dotfiles/themes/.themes ~/
# Enable color in nano editor for user
ln -sf ~/.dotfiles/nano/.nanorc ~/
ln -sf ~/.dotfiles/aurorae ~/.local/share/
source ~/.zshrc

# Enable color in nano editor for root user
sudo ln -sf ~/.dotfiles/nano/.nanorc /root
# Arcolinux Mirror
sudo ln -sf ~/.dotfiles/pacman-mirrior/etc/pacman.d/arcolinux-mirrorlist /etc/pacman.d/
sudo cp -r ~/.oh-my-zsh /root
sudo ln -sf ~/.dotfiles/zsh_aliases/.zsh_aliases /root/
sudo ln -sf ~/.dotfiles/zshrc/.zshrc /root
sudo ln -sf ~/.dotfiles/powerlevel10k-root/.p10k.zsh /root/
sudo ln -sf ~/.dotfiles/neofetch-source/.neofetch-config2.conf /root
sudo ln -sf ~/.dotfiles/neofetch-ascii/usr/bin/neofetch /usr/bin





# Pictures Restore
cd ~/Pictures
git clone https://github.com/Oyinbra/Pictures.git
cd Pictures
cp -r Screenshots Wallpaper ~/Pictures
cd ..
rm -rf Pictures
