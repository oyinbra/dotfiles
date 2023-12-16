#!/bin/zsh

# ███ █ █ ███   █   █ ███ █   █ ███ ███ ███ ███
# █ █ █ █ █     ██ ██ █ █ ██  █ █ █ █   █   █ █
# ███ ██  █     █ █ █ █ █ █ █ █ █ █ █   ███ ██
# █   █ █ █ █   █   █ ███ █  ██ ███ █ █ █   █ █
# █   █ █ ███   █   █ █ █ █   █ █ █ ███ ███ █ █

# -------------------------------------------
# Configure Arch mirror list
# -------------------------------------------
# Install a package using (AUR helper)
alias deploy="yay -S"

# Remove a package using (AUR helper)
alias purge="yay -R"

# Update the package list with 'sudo pacman'
alias update="sudo pacman -Sy"

# Upgrade installed packages with 'sudo pacman'
alias upgrade="sudo pacman -Syu"

# Refresh the file database with 'sudo pacman'
alias refresh="sudo pacman -Fy"

# Check if a package in install
alias check="pacman -Q | grep"

# Sync Packages
alias align="yay -Syy"

# Search for packages using 'sudo pacman'
alias search="sudo pacman -Ss"

# Query installed packages with 'pacman'
alias query="pacman -Qs"

# Install a package from a file using 'sudo pacman'
alias pacfile="sudo pacman -S --needed - <"

# Downgrade a package using 'sudo pacman'
alias downgrade="sudo pacman -Suu"

# Upgrade/Install a package using package file
alias pkg="sudo pacman -U"

# Clean package cache with 'sudo pacman'
alias pacclean="sudo pacman -Sc"

# Remove old packages from the cache with 'sudo pacman'
alias pacalien="sudo pacman -c"

# Clean all package cache with 'sudo pacman'
alias paccache="sudo pacman -Scc"

# List cached packages in /var/cache/pacman/pkg
alias paclistpkg="ls /var/cache/pacman/pkg | less"

# List orphan packages with 'sudo pacman'
alias paclistorphan="sudo pacman -Qtdq"

# Remove orphan packages with 'sudo pacman'
alias pacremorphan="sudo pacman -R $(pacman -Qtdq)"

# Display package dependencies recursively with 'pactree'
alias pactree.r="pactree -r"

# Remove a package and its unneeded dependencies with 'sudo pacman'
alias pacrs="sudo pacman -Rs"

# Remove a package and its dependencies with 'sudo pacman'
alias pacrns="sudo pacman -Rns"

# Find the package providing a specific file with 'pacman -F'
alias pacfind="pacman -F"

# Unlock pacman database if stuck by removing the lock file
alias pacunlock="sudo rm -rf /var/lib/pacman/db.lck"

# Set mirrors for Arch Linux (Jaro) using 'sudo pacman-mirrors'
alias pacmanjaro="sudo pacman-mirrors --fasttrack"

# View last installed packages
alias paclast='if [ -f /var/log/pacman.log ]; then expac --timefmt="%Y-%m-%d %T" "%l|%-30n|%-15d" $(zcat /var/log/pacman.log* 2>/dev/null | awk "/^\[.*\] installed/ {print \$1}") | sort | tail -n 100; else echo "Pacman log file not found or not in gzip format"; fi'

# -------------------------------------------
# FLATPAK
# -------------------------------------------
alias flatins="flatpak install flathub"
alias flatrem="flatpak remove"

# -------------------------------------------
# SNAP
# -------------------------------------------
alias snapins="sudo snap install"
alias snaprem="sudo snap remove"

