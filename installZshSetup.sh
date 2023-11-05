#!/bin/bash

echo "
#############################################################################
#############################################################################
##                                                                         ##
##                           MY ZSH CONFIGURATION                          ##
##                                                                         ##
#############################################################################
#############################################################################"

# Install required packages
sudo pacman -S zsh npm zoxide fzf || { echo "Package installation failed"; return; }


# Create symbolic links for zsh shell configurations
ln -sTf "$HOME/Dotfiles/zsh/zplug" "$HOME/.zplug"
ln -sTf "$HOME/Dotfiles/zsh/conf/.zshrc" "$HOME/"
ln -sTf "$HOME/Dotfiles/zsh" "$HOME/.config/"
ln -sTf "$HOME/Dotfiles/zsh/p10k-user/.p10k.zsh" "$HOME/"
ln -sTf "$HOME/Dotfiles/zsh/neofetch-source/.neofetch-config2.conf" "$HOME/"
sudo ln -sTf "$HOME/Dotfiles/zsh/neofetch-ascii/usr/bin/neofetch" "/usr/bin"

# Change the default shell to Zsh
chsh -s /bin/zsh "$USER"
