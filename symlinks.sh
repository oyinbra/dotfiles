#!/bin/bash

cat << "EOF"

███ ███ ███ ███ ███ ███ ███   ███ █ █ █   █ █   ███ █   █ █ █ ███
█ █ █   █    █  █ █ █ █ █     █   █ █ ██ ██ █    █  ██  █ █ █ █
██  ███  █   █  █ █ ██  ███    █   █  █ █ █ █    █  █ █ █ ██   █
█ █ █     █  █  █ █ █ █ █       █  █  █   █ █    █  █  ██ █ █   █
█ █ ███ ███  █  ███ █ █ ███   ███  █  █   █ ███ ███ █   █ █ █ ███

EOF

# ------------------------------------------------------
# Load library from modules directory in Dotfiles
# ------------------------------------------------------
source $(dirname "$0")/modules/library.sh
clear

# ------------------------------------------------------
# Create symbolic links for gitignore_global
# ------------------------------------------------------
ln -sTf "$HOME/Dotfiles/git/.gitignore_global" "$HOME/.gitignore_global"

# ------------------------------------------------------
# Create symbolic links for other configurations
# ------------------------------------------------------
ln -sTf "$HOME/Dotfiles/.config/alacritty" "$HOME/.config/alacritty"
rm -rf "$HOME/.config/kitty"
ln -sTf "$HOME/Dotfiles/.config/kitty" "$HOME/.config/kitty"
ln -sTf "$HOME/Dotfiles/.config/mpv" "$HOME/.config/mpv"
ln -sTf "$HOME/Workspace/Projects/nvim" "$HOME/.config/nvim"
ln -sTf "$HOME/Dotfiles/.config/autostart" "$HOME/.config/autostart"
ln -sTf "$HOME/Dotfiles/sxhkd" "$HOME/.config/sxhkd"
ln -sTf "$HOME/Dotfiles/rofi" "$HOME/.config/rofi"
# ------------------------------------------------------
# Root
# ------------------------------------------------------
sudo ln -sTf "$HOME/.env" "/root"
sudo mkdir -p "/root/.local/share"
sudo rm -rf "/root/.local/share/nvim"
sudo ln -sf "$HOME/.local/share/nvim" "/root/.local/share/nvim"

