#!/bin/zsh

# ███ █ █ ███   █   █ ███ █   █ ███ ███ ███ ███
# █ █ █ █ █     ██ ██ █ █ ██  █ █ █ █   █   █ █
# ███ ██  █     █ █ █ █ █ █ █ █ █ █ █   ███ ██
# █   █ █ █ █   █   █ ███ █  ██ ███ █ █ █   █ █
# █   █ █ ███   █   █ █ █ █   █ █ █ ███ ███ █ █

# Install a package using (AUR helper)
alias deploy="yay -S"

# Remove a package using (AUR helper)
alias purge="yay -R"

# Update the package list with 'yay'
alias update="yay -Sy"

# Upgrade installed packages with 'yay'
alias upgrade="yay"

# Refresh the file database with 'yay'
alias refresh="yay -Fy"

# Check if a package in install
alias check="yay -Q | grep"

# Sync Packages
alias align="yay -Syy"

# Search for packages using 'yay'
alias search="yay -Ss"

# Query installed packages with 'yay'
alias query="yay -Qs"

# Install a package from a file using 'yay'
alias pacfile="yay -S --needed - <"

# Downgrade a package using 'yay'
alias downgrade="yay -Suu"

# Upgrade/Install a package using package file
alias pkg="yay -U"

# Clean package cache with 'yay'
alias pacclean="yay -Sc"

# Remove old packages from the cache with 'yay'
alias pacalien="yay -c"

# Clean all package cache with 'yay'
alias paccache="yay -Scc"

# List cached packages in /var/cache/pacman/pkg
alias paclistpkg="ls /var/cache/pacman/pkg | less"

# List orphan packages with 'yay'
alias paclistorphan="yay -Qtdq"

# Remove orphan packages with 'yay'
alias pacremorphan="yay -R $(yay -Qtdq)"

# Display package dependencies recursively with 'pactree'
alias pactree.r="pactree -r"

# Remove a package and its unneeded dependencies with 'yay'
alias pacrs="yay -Rs"

# Remove a package and its dependencies with 'yay'
alias pacrns="yay -Rns"

# Find the package providing a specific file with 'yay -F'
alias pacfind="yay -F"

# Unlock pacman database if stuck by removing the lock file
alias pacunlock="sudo rm -rf /var/lib/pacman/db.lck"

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

