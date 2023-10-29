#!/bin/sh
# ##############################################
# ############## DIRECTORY ALIASES #############
# ##############################################

# .config
alias zzconfig="~/.config"
alias zznvim="~/.config/nvim"

# Local user Backup
alias backup="sudo /home/oyinbra/Dotfiles/backup.sh"
alias backup.pkg="sudo rsync -aAXv --delete /var/cache/pacman/pkg /Backup"
# Local user Restore  
alias restore="sudo /home/oyinbra/Dotfiles/restore.sh"      

# Search for files or folders including hidden folders and files
alias list="ls -a | grep -i"

# Refresh zsh
alias sz="source ~/.zshrc"

# Zsh config
alias zxzshrc="nvim ~/.zshrc"

# Bash config
alias zxbash="nvim ~/.bashrc"

# Neofetch Distro
alias zxneofetch="nvim ~/.config/neofetch/config.conf"

# Zsh aliases config
alias zxalias="nvim ~/.config/zsh/aliases.zsh"
alias zxkitty="nvim ~/.config/kitty/kitty.conf"

#Dotfiles
alias zzdotfiles="~/Dotfiles"

# Work Directory
alias zzworkspace="cd ~/Workspace"
alias zzpython="cd ~/Workspace/python"
alias zzopensource="cd ~/Workspace/OpenSourceContribution/"

alias zzkitty="~/.config/kitty/"
# Project Directory
alias zzprojects="cd ~/Workspace/Projects"

# PKG Packages
alias zzpkg="/var/cache/pacman/pkg"

# Pictures Folder
alias zzpictures="~/Pictures"

# Coinmarketcapital
alias cmc="python -u /home/$USER/Workspace/python/cmc.py"

# Check Folder size
alias fs="du -sh"

# User Share Themes
alias zzthemes="/usr/share/themes"

# User Share Icons
alias zzicons="/usr/share/icons"

# User Share Fonts
alias zzfonts="/usr/share/fonts"

# Hostname config
alias zzhostname="sudo nano /etc/hostname"

# Git folder
alias zztmp="~/Tmp"