#!/bin/zsh

# ##############################################
# ########### PACKAGE MANAGER  #################
# ##############################################

set_package_aliases() {
    if [ -x "$(command -v lsb_release)" ]; then
        if [ "$(lsb_release -si)" = "Debian" ]; then
        
            # ##############################################
            # ####### DEBIAN BASED DISTROS ALIASES #########
            # ##############################################
            alias deploy="sudo apt install"
            alias purge="sudo apt remove"
            alias update="sudo apt update"
            alias upgrade="sudo apt upgrade"
            # Delete apt-repo
            alias apt.r="sudo add-apt-repository --remove"
            # Add apt-repo
            alias apt.a="sudo add-apt-repository"
            # List Upgradable packages
            alias apt.l='apt list --upgradable'
            # Clean Packages
            alias apt.c='sudo apt autoclean && sudo apt autoremove'
        elif [ "$(lsb_release -si)" = "Arch" ]; then

            # ##############################################
            # ######## ARCH BASED DISTROS ALIASES ##########
            # ##############################################
            alias yay="paru"
            alias deploy="yay -S"
            alias purge="yay -R"
            alias update="sudo pacman -Sy"
            alias upgrade="sudo pacman -Syu"
            alias align="yay -Syy"
        else
            echo "Unsupported distribution"
        fi
    else
        echo "lsb_release command not found. Unsupported distribution."
    fi
}

set_package_aliases


# ##############################################
# ############### PACMAN #######################
# ##############################################

# refresh pacman database
alias pacfresh="sudo pacman -Fy"
# update packages
alias ud="sudo pacman -Sy --noconfirm"
# upgrade packages
alias ug="sudo pacman -Syu"
alias pacins="sudo pacman -S"
alias pacsearch="sudo pacman -Ss"

# to search for already installed packages
alias pacqs="pacman -Qs"
alias pacinsnc="sudo pacman -S --noconfirm"
alias pacrem="sudo pacman -R"
alias pacfile="sudo pacman -S --needed - <"
# Downgrade Packages
alias pacdgrade="sudo pacman -Suu"

# Install pkg files
alias pacpkg="sudo pacman -U"

# Clean uninstalled packages from cache
alias pacclean="sudo pacman -Sc"

# Clean alien packages
alias pacalien="sudo pacman -c"

# Clean all packages from cache
alias paccache="sudo pacman -Scc"

# List packages in pkg cache file
alias paclistpkg="l /var/cache/pacman/pkg | less"

# List orphan packages
alias paclistorphan="sudo pacman -Qtdq"

# List and Remove orphan packages
alias pacremorphan="sudo pacman -R $(pacman -Qtdq)"

# Pactree
alias pactree.r="pactree -r"

# Completely clean packages
alias pacrs="sudo pacman -Rs"

# Completely remove packages
alias pacrns="sudo pacman -Rns"

# Find packages to install
alias pacfind="pacman -F"

# Pacman is currently in use, please wait...
alias pacunlock="sudo rm -rf /var/lib/pacman/db.lck"

# Update Pacman Mirrors for Manjaro
alias pacmanjaro="sudo pacman-mirrors --fasttrack"

# List the last installed packeages
alias paclast='if [ -f /var/log/pacman.log ]; then expac --timefmt="%Y-%m-%d %T" "%l|%-30n|%-15d" $(zcat /var/log/pacman.log* 2>/dev/null | awk "/^\[.*\] installed/ {print \$1}") | sort | tail -n 100; else echo "Pacman log file not found or not in gzip format"; fi'

# ##############################################
# ############### FLATPAK ######################
# ##############################################

alias flatins="flatpak install flathub"
alias flatrem="flatpak remove"

# ##############################################
# ############### SNAP #########################
# ##############################################

alias snapins="sudo snap install"
alias snaprem="sudo snap remove"