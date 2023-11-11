#!/bin/bash

cat << "EOF"

 ███████████  █████████  █████   █████
░█░░░░░░███  ███░░░░░███░░███   ░░███ 
░     ███░  ░███    ░░░  ░███    ░███ 
     ███    ░░█████████  ░███████████ 
    ███      ░░░░░░░░███ ░███░░░░░███ 
  ████     █ ███    ░███ ░███    ░███ 
 ███████████░░█████████  █████   █████
░░░░░░░░░░░  ░░░░░░░░░  ░░░░░   ░░░░░ 

EOF

# ------------------------------------------------------
# ZSH SHELL SETUP
# ------------------------------------------------------

# ------------------------------------------------------
# Load library from modules directory in Dotfiles
# ------------------------------------------------------
source $(dirname "$0")/modules/library.sh
clear

cat << "EOF"

 █████                     █████              ████  ████ 
░░███                     ░░███              ░░███ ░░███ 
 ░███  ████████    █████  ███████    ██████   ░███  ░███ 
 ░███ ░░███░░███  ███░░  ░░░███░    ░░░░░███  ░███  ░███ 
 ░███  ░███ ░███ ░░█████   ░███      ███████  ░███  ░███ 
 ░███  ░███ ░███  ░░░░███  ░███ ███ ███░░███  ░███  ░███ 
 █████ ████ █████ ██████   ░░█████ ░░████████ █████ █████
░░░░░ ░░░░ ░░░░░ ░░░░░░     ░░░░░   ░░░░░░░░ ░░░░░ ░░░░░ 

EOF

# ------------------------------------------------------
# Install required packages
# ------------------------------------------------------
packagesPacman=(
    "zsh"
    "npm"
    "zoxide"
    "fzf"
);

# ------------------------------------------------------
# Install required packages
# ------------------------------------------------------
_installPackagesPacman "${packagesPacman[@]}";
clear

# ------------------------------------------------------
# Create symbolic links for zsh shell configurations
# ------------------------------------------------------
_installSymLink "zplug" "$HOME/.zplug" "$HOME/Dotfiles/zsh/zplug" "$HOME/.zplug"
_installSymLink ".zshrc" "$HOME/.zshrc" "$HOME/Dotfiles/zsh/conf/.zshrc" "$HOME/.zshrc"
_installSymLink "zsh" "$HOME/.config/zsh" "$HOME/Dotfiles/zsh" "$HOME/.config/zsh"
_installSymLink ".p10k.zsh" "$HOME/.p10k.zsh" "$HOME/Dotfiles/zsh/p10k-user/.p10k.zsh" "$HOME/.p10k.zsh"
_installSymLink ".neofetch-config2.conf" "$HOME/.neofetch-config2.conf" "$HOME/Dotfiles/zsh/neofetch-source/.neofetch-config2.conf" "$HOME/.neofetch-config2.conf"

# ------------------------------------------------------
# install a symbolic link for neofetch
# ------------------------------------------------------
_installSymLink "neofetch" "/usr/bin/neofetch" "$HOME/Dotfiles/zsh/neofetch-ascii/usr/bin/neofetch" "/usr/bin/neofetch"
clear

# ------------------------------------------------------
# Change the default shell to Zsh
# ------------------------------------------------------
read -p "DO YOU WANT TO CHANGE YOUR SHELL TO ZSH? (y/n): " choice

if [ "$choice" == "y" ] || [ "$choice" == "Y" ]; then
    chsh -s /bin/zsh "$USER"
    echo "Shell changed to Zsh."
elif [ "$choice" == "n" ] || [ "$choice" == "N" ]; then
    echo "Shell remains unchanged."
else
    echo "Invalid choice. Please enter 'y' or 'n'."
fi

# ------------------------------------------------------
# Source Zsh configuration
# ------------------------------------------------------
read -p "DO YOU WANT TO LOG INTO ZSH? (y/n): " answer

if [[ "$answer" == "y" || "$answer" == "Y" ]]; then
    exec zsh -c "source ~/.zshrc"
else
    echo "Command execution aborted."
fi