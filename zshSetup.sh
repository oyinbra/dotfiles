#!/bin/bash

cat << "EOF"

███ ███ █ █   ███ ███ ███ █ █ ███
  █ █   █ █   █   █    █  █ █ █ █
 █   █  ███    █  ███  █  █ █ ███
█     █ █ █     █ █    █  █ █ █
███ ███ █ █   ███ ███  █  ███ █

EOF

# ------------------------------------------------------
# Load library from modules directory in Dotfiles
# ------------------------------------------------------
source $(dirname "$0")/modules/library.sh
clear

cat << "EOF" #install
▄▖▖ ▖▄▖▄▖▄▖▖ ▖   ▄▖▄▖▄▖▖▖▄▖▄▖▄▖▄   ▄▖▖▖▄▖▄▖
▐ ▛▖▌▚ ▐ ▌▌▌ ▌   ▙▘▙▖▌▌▌▌▐ ▙▘▙▖▌▌  ▙▌▙▘▌ ▚
▟▖▌▝▌▄▌▐ ▛▌▙▖▙▖  ▌▌▙▖█▌▙▌▟▖▌▌▙▖▙▘  ▌ ▌▌▙▌▄▌
                      ▘
EOF
confirm_start
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
_installSymLink ".zshrc" "$HOME/Dotfiles/zsh/.zshrc" "$HOME/.zshrc"
_installSymLink "zsh" "$HOME/Dotfiles/zsh" "$HOME/.config/.zsh"

# ------------------------------------------------------
# install a symbolic link for neofetch
# ------------------------------------------------------
# FUNCTION      NAME          SOURCE                        TARGET
_installSymLink "neofetch" "$HOME/Dotfiles/zsh/usr/bin/neofetch" "/usr/bin/neofetch"
clear

# ------------------------------------------------------
# Change the default shell to Zsh
# ------------------------------------------------------
cat << "EOF"
▄▖▖▖▄▖▖ ▖▄▖▄▖  ▄▖▖▖▄▖▖ ▖   ▄▖▄▖  ▄▖▄▖▖▖▄▖
▌ ▙▌▌▌▛▖▌▌ ▙▖  ▚ ▙▌▙▖▌ ▌   ▐ ▌▌  ▗▘▚ ▙▌▗▘
▙▖▌▌▛▌▌▝▌▙▌▙▖  ▄▌▌▌▙▖▙▖▙▖  ▐ ▙▌  ▙▖▄▌▌▌▗

EOF

# ------------------------------------------------------
# Check if the current shell is zsh
# ------------------------------------------------------
if [ "$SHELL" = "/bin/zsh" ]; then
    echo "Your current shell is already Zsh. No need to change."
    exit 0
fi

# ------------------------------------------------------
# Ask the user whether they want to change the shell
# ------------------------------------------------------
read -p "Do you want to change your shell to Zsh? (y/n, default: n): " choice

# ------------------------------------------------------
# Use default choice if the user just presses Enter
# ------------------------------------------------------
choice=${choice:-n}

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
cat << "EOF"
▖ ▄▖▄▖  ▄▖▖ ▖▄▖▄▖  ▄▖▄▖▖▖▄▖
▌ ▌▌▌   ▐ ▛▖▌▐ ▌▌  ▗▘▚ ▙▌▗▘
▙▖▙▌▙▌  ▟▖▌▝▌▐ ▙▌  ▙▖▄▌▌▌▗

EOF
read -p "DO YOU WANT TO LOG INTO ZSH? (y/n): " answer

if [[ "$answer" == "y" || "$answer" == "Y" ]]; then
    exec zsh
else
    echo "Command execution aborted."
fi

# -----------------------------------------
# Done
# -----------------------------------------
cat << "EOF"

██  ███ █   █ ███
█ █ █ █ ██  █ █
█ █ █ █ █ █ █ ███
█ █ █ █ █  ██ █
██  ███ █   █ ███

EOF

