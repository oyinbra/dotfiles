#!/bin/bash
echo "
#############################################################################
#############################################################################
##                                                                         ##
##                        KDE PLASMA RESTORE SCRIPT                        ##
##                                                                         ##
#############################################################################
#############################################################################"

# ./restore-system-directories.sh
# ./restore-arcolinux-chaotic-repos.sh
sudo pacman -S --needed - < ./myPackages.txt
# ./restore-symlinks.sh
# ./restore-aur-packages.sh
