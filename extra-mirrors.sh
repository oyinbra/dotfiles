#!/bin/bash

cat << "EOF"

 _____      _               __  __ _
| ____|_  _| |_ _ __ __ _  |  \/  (_)_ __ _ __ ___  _ __ ___
|  _| \ \/ / __| '__/ _` | | |\/| | | '__| '__/ _ \| '__/ __|
| |___ >  <| |_| | | (_| | | |  | | | |  | | | (_) | |  \__ \
|_____/_/\_\\__|_|  \__,_| |_|  |_|_|_|  |_|  \___/|_|  |___/

EOF

# ------------------------------------------------------
# Install required packages
# ------------------------------------------------------
sudo pacman -S wget --noconfirm --needed

echo "Getting the ArcoLinux keys from the ArcoLinux repo"

sudo wget https://github.com/arcolinux/arcolinux_repo/raw/main/x86_64/arcolinux-keyring-20251209-3-any.pkg.tar.zst -O /tmp/arcolinux-keyring-20251209-3-any.pkg.tar.zst
sudo pacman -U --noconfirm --needed /tmp/arcolinux-keyring-20251209-3-any.pkg.tar.zst

# ------------------------------------------------------
# Get the latest mirror file
# ------------------------------------------------------
echo "Getting the latest arcolinux mirrors file"

# sudo wget https://github.com/arcolinux/arcolinux_repo/raw/main/x86_64/arcolinux-mirrorlist-git-25.04-05-any.pkg.tar.zst -O /tmp/arcolinux-mirrorlist-git-25.04-05-any.pkg.tar.zst
# sudo pacman -U --noconfirm --needed /tmp/arcolinux-mirrorlist-git-25.04-05-any.pkg.tar.zst

sudo tee /etc/pacman.d/arcolinux-mirrorlist > /dev/null << 'EOF'
# Europe Netherlands Amsterdam
#Server = https://ant.seedhost.eu/arcolinux/$repo/$arch

# Gitlab United States
# Server = https://gitlab.com/arcolinux/$repo/-/raw/main/$arch

# Europe Belgium Brussels
Server = https://ftp.belnet.be/arcolinux/$repo/$arch

# Australia
Server = https://mirror.aarnet.edu.au/pub/arcolinux/$repo/$arch

# South Korea
Server = https://mirror.funami.tech/arcolinux/$repo/$arch

# Singapore
Server = https://mirror.jingk.ai/arcolinux/$repo/$arch

# United States San Francisco - no xlarge repo here
Server = https://arcolinux.github.io/$repo/$arch
EOF


# ------------------------------------------------------
# Create backup for pacman.conf
# ------------------------------------------------------
sudo cp /etc/pacman.conf /etc/pacman.bak

echo '
#[arcolinux_repo_testing]
#SigLevel = Optional TrustedOnly
#Include = /etc/pacman.d/arcolinux-mirrorlist
[arcolinux_repo]
SigLevel = Optional TrustedOnly
Include = /etc/pacman.d/arcolinux-mirrorlist
[arcolinux_repo_3party]
SigLevel = Optional TrustedOnly
Include = /etc/pacman.d/arcolinux-mirrorlist
[arcolinux_repo_xlarge]
SigLevel = Optional TrustedOnly
Include = /etc/pacman.d/arcolinux-mirrorlist' | sudo tee --append /etc/pacman.conf

sudo pacman -Sy archlinux-tweak-tool-git --noconfirm --needed

# ------------------------------------------------------
# Add chaotic repo to pacman.conf
# ------------------------------------------------------
echo '
[chaotic-aur]
SigLevel = PackageRequired
Include = /etc/pacman.d/chaotic-mirrorlist' | sudo tee --append /etc/pacman.conf

echo '
[endeavouros]
SigLevel = PackageRequired
Include = /etc/pacman.d/endeavouros-mirrorlist' | sudo tee --append /etc/pacman.conf

sudo pacman -Sy
