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
packages=("zsh" "npm" "zoxide" "fzf")

for package in "${packages[@]}"; do
    if ! pacman -Qs "$package" > /dev/null; then
        echo "Installing $package..."
        if sudo pacman -S --noconfirm "$package"; then
            echo "$package installed successfully."
        else
            echo "Error: Failed to install $package. Exiting script."
            exit 1
        fi
    else
        echo "$package is already installed."
    fi
done

# ------------------------------------------------------
# Function to prompt for symlink creation
# ------------------------------------------------------
create_symlink() {
    source="$1"
    target="$2"

    # ------------------------------------------------------
    # Check if the target is a directory
    # ------------------------------------------------------
    if [ -d "$target" ]; then
        read -p "The target directory '$target' exists. Do you want to replace it? (yes/no): " replace_dir
        if [ "$replace_dir" != "yes" ]; then
            echo "Skipping symlink creation for $source"
            return
        fi
    fi

    # ------------------------------------------------------
    # Check if the symlink already exists
    # ------------------------------------------------------
    if [ -e "$target" ]; then
        read -p "The symlink '$target' already exists. Do you want to replace it? (yes/no): " replace_symlink
        if [ "$replace_symlink" != "yes" ]; then
            echo "Skipping symlink creation for $source"
            return
        fi
    fi

    # ------------------------------------------------------
    # Create the symlink
    # ------------------------------------------------------
    ln -sTf "$source" "$target"
    echo "Symlink created: $target -> $source"
}

# ------------------------------------------------------
# Create symbolic links for zsh shell configurations
# ------------------------------------------------------
create_symlink "$HOME/Dotfiles/zsh/zplug" "$HOME/.zplug"
create_symlink "$HOME/Dotfiles/zsh/conf/.zshrc" "$HOME/.zshrc"
create_symlink "$HOME/Dotfiles/zsh" "$HOME/.config/zsh"
create_symlink "$HOME/Dotfiles/zsh/p10k-user/.p10k.zsh" "$HOME/.p10k.zsh"
create_symlink "$HOME/Dotfiles/zsh/neofetch-source/.neofetch-config2.conf" "$HOME/.neofetch-config2.conf"
sudo create_symlink "$HOME/Dotfiles/zsh/neofetch-ascii/usr/bin/neofetch" "/usr/bin/neofetch"

# ------------------------------------------------------
# Change the default shell to Zsh
# ------------------------------------------------------
chsh -s /bin/zsh "$USER"
