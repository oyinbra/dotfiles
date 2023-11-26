#!/bin/bash

cat << "EOF"
 _________  _   _
|__  / ___|| | | |
  / /\___ \| |_| |
 / /_ ___) |  _  |
/____|____/|_| |_|

EOF

# ------------------------------------------------------
# ZSH SHELL SETUP
# ------------------------------------------------------

# ------------------------------------------------------
# Load library from modules directory in Dotfiles
# ------------------------------------------------------
source $(dirname "$0")/modules/library.sh
clear

cat << "EOF" #install
 ___           _        _ _
|_ _|_ __  ___| |_ __ _| | |
 | || '_ \/ __| __/ _` | | |
 | || | | \__ \ || (_| | | |
|___|_| |_|___/\__\__,_|_|_|

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
# Create .config in home directory if not available
# ------------------------------------------------------
check_and_create_config_directory() {
  config_dir="$HOME/.config"

  # Check if the directory exists
  if [ ! -d "$config_dir" ]; then
    # If not, create it
    mkdir -p "$config_dir"
    echo "Created .config directory at $config_dir"
  else
    echo ".config directory already exists at $config_dir"
  fi
}
# ------------------------------------------------------
# Create symbolic links for zsh shell configurations
# ------------------------------------------------------
# FUNCTION      NAME          SOURCE                        TARGET
_installSymLink ".zshrc" "$HOME/Dotfiles/zsh/conf/.zshrc" "$HOME/.zshrc"
_installSymLink "zsh" "$HOME/Dotfiles/zsh" "$HOME/.config/zsh"
_installSymLink ".p10k.zsh" "$HOME/Dotfiles/zsh/p10k-user/.p10k.zsh" "$HOME/.p10k.zsh"
_installSymLink ".neofetch-config2.conf" "$HOME/Dotfiles/zsh/neofetch-source/.neofetch-config2.conf" "$HOME/.neofetch-config2.conf"

# ------------------------------------------------------
# install a symbolic link for neofetch
# ------------------------------------------------------
# FUNCTION      NAME          SOURCE                        TARGET
_installSymLink "neofetch" "$HOME/Dotfiles/zsh/neofetch-ascii/usr/bin/neofetch" "/usr/bin/neofetch"
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

# -----------------------------------------
# Done
# -----------------------------------------
cat << "EOF"
 ____   ___  _   _ _____
|  _ \ / _ \| \ | | ____|
| | | | | | |  \| |  _|
| |_| | |_| | |\  | |___
|____/ \___/|_| \_|_____|

EOF

# echo "NEXT: "

