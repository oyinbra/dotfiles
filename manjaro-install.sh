sudo pacman -S latte-dock
cd
git clone https://github.com/Oyinbra/.dotfiles.git

ln -sf ~/.dotfiles/fonts/.fonts ~/
ln -sf ~/.dotfiles/git/.gitignore_global ~/
ln -sf ~/.dotfiles/icons/.icons ~/
ln -sf ~/.dotfiles/konsole/.local/share/konsole/oyinbra.profile ~/.local/share/konsole
ln -sf ~/.dotfiles/latte-dock/.config/latte ~/.config
ln -sf ~/.dotfiles/latte-dock/.config/lattedockrc ~/.config
ln -sf ~/.dotfiles/neofetch-source/.neofetch-config2.conf ~/
ln -sf ~/.dotfiles/themes/.themes ~/
ln -sf ~/.dotfiles/zsh_aliases/.zsh_aliases ~/
ln -sf ~/.dotfiles/zshrc-manjaro/.zshrc ~/
# Enable color in nano editor for user
ln -sf ~/.dotfiles/aurorae ~/.local/share/
source ~/.zshrc


sudo ln -sf ~/.dotfiles/neofetch-source/.neofetch-config2.conf /root
sudo ln -sf ~/.dotfiles/zsh_aliases/.zsh_aliases /root/
sudo ln -sf /home/oyinbra/.dotfiles/zhistory/.zhistory /root
sudo ln -sf /home/oyinbra/.dotfiles/zshrc-manjaro/.zshrc /root

# Pictures Restore
cd ~/Pictures
git clone https://github.com/Oyinbra/Pictures.git
cd Pictures
cp -r Screenshots Wallpaper ~/Pictures
cd ..
rm -rf Pictures
