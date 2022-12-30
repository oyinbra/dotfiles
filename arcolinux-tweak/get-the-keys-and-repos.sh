#!/bin/bash
# run with sudo ./get-the-keys-and-repos.sh

##########################################################################
####                                                                  ####
###        Adding ArcoLinux keys, repos and updating pacman.conf       ###
####                                                                  ####
##########################################################################

sudo pacman -S wget --noconfirm --needed

echo "###############################################################################"
echo "Getting the ArcoLinux keys from the ArcoLinux repo"
echo "###############################################################################"
echo
sudo pacman -U --noconfirm --needed arcolinux-keyring-20251209-3-any.pkg.tar.zst 

#####################################################################################

echo "###############################################################################"
echo "Getting the latest arcolinux mirrors file"
echo "###############################################################################"
echo
sudo pacman -U --noconfirm --needed arcolinux-mirrorlist-git-22.12-01-any.pkg.tar.zst

######################################################################################

echo "###############################################################################"
echo "Updating /etc/pacman.conf with arcolinux mirrorlist"
echo "###############################################################################"
echo

echo '

#[arcolinux_repo_testing]
#SigLevel = Required DatabaseOptional
#Include = /etc/pacman.d/arcolinux-mirrorlist

[arcolinux_repo]
SigLevel = Required DatabaseOptional
Include = /etc/pacman.d/arcolinux-mirrorlist

[arcolinux_repo_3party]
SigLevel = Required DatabaseOptional
Include = /etc/pacman.d/arcolinux-mirrorlist

[arcolinux_repo_xlarge]
SigLevel = Required DatabaseOptional
Include = /etc/pacman.d/arcolinux-mirrorlist' | sudo tee --append /etc/pacman.conf


echo "###############################################################################"
echo "###                DONE - YOU CAN CLOSE THIS WINDOW                        ####"
echo "###############################################################################"

######################################################################################