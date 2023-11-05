#!/bin/zsh

# ##############################################
# ############## MIRROR ALIASES ################
# ##############################################


# Configure Arch mirror list
alias zxarch.mirror="sudo vim /etc/pacman.d/mirrorlist"

# Configure EndeavourOS Mirror List
alias zxendeavouros.mirror="sudo vim /etc/pacman.d/endeavouros-mirrorlist"

# Configure Chaotic Mirror List
alias zxchaotic.mirror="sudo vim /etc/pacman.d/chaotic-mirrorlistt"

# Update Manjaro Mirrors
alias rate.manjaro="rate-mirrors --allow-root --protocol https manjaro | sudo tee /etc/pacman.d/mirrorlist"

# Update Arch Mirrors
alias rate.arch="rate-mirrors --allow-root --protocol https arch | sudo tee /etc/pacman.d/mirrorlist"
alias reflector.arch="sudo reflector --verbose --latest 10 --protocol https --sort rate --save /etc/pacman.d/mirrorlist"

# Update EndeavourOS mirror
alias rate.endeavouros="rate-mirrors --allow-root --protocol https endeavouros | sudo tee /etc/pacman.d/endeavouros-mirrorlist"
