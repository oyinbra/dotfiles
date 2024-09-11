#!/bin/bash

cat << "EOF"

███ ███ ███ ███ ███ ███ ███   ███ █ █ █   █ █   ███ █   █ █ █ ███
█ █ █   █    █  █ █ █ █ █     █   █ █ ██ ██ █    █  ██  █ █ █ █
██  ███  █   █  █ █ ██  ███    █   █  █ █ █ █    █  █ █ █ ██   █
█ █ █     █  █  █ █ █ █ █       █  █  █   █ █    █  █  ██ █ █   █
█ █ ███ ███  █  ███ █ █ ███   ███  █  █   █ ███ ███ █   █ █ █ ███

EOF

# ------------------------------------------------------
# Load library from modules directory in dotfiles
# ------------------------------------------------------
source $(dirname "$0")/modules/library.sh
clear

# ------------------------------------------------------
# Create symbolic links for gitignore_global
# ------------------------------------------------------
ln -sTf "$HOME/dotfiles/git/.gitignore_global" "$HOME/.gitignore_global"

# ------------------------------------------------------
# Create symbolic links for other configurations
# ------------------------------------------------------
ln -sTf "$HOME/dotfiles/.config/alacritty" "$HOME/.config/alacritty"
rm -rf "$HOME/.config/kitty"
ln -sTf "$HOME/dotfiles/.config/kitty" "$HOME/.config/kitty"
ln -sTf "$HOME/dotfiles/.config/mpv" "$HOME/.config/mpv"
ln -sTf "$HOME/Workspace/Projects/nvim" "$HOME/.config/nvim"
ln -sTf "$HOME/dotfiles/.config/autostart" "$HOME/.config/autostart"
ln -sTf "$HOME/dotfiles/sxhkd" "$HOME/.config/sxhkd"
ln -sTf "$HOME/dotfiles/rofi" "$HOME/.config/rofi"
# ------------------------------------------------------
# Root
# ------------------------------------------------------
sudo ln -sTf "$HOME/.env" "/root/.env"
sudo mkdir -p "/root/.local/share"
sudo rm -rf "/root/.local/share/nvim"
sudo ln -sf "$HOME/.local/share/nvim" "/root/.local/share/nvim"

