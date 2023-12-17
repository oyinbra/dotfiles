#!/bin/zsh

# █   █ ███ ███ ███ ███ ███   ███ █   ███ ███ ███ ███ ███
# ██ ██  █  █ █ █ █ █ █ █ █   █ █ █    █  █ █ █   █   █
# █ █ █  █  ██  ██  █ █ ██    █ █ █    █  █ █  █  ███  █
# █   █  █  █ █ █ █ █ █ █ █   ███ █    █  ███   █ █     █
# █   █ ███ █ █ █ █ ███ █ █   █ █ ███ ███ █ █ ███ ███ ███

# -------------------------------------------
# Configure Arch mirror list
# -------------------------------------------
alias zxarch.mirror="sudo vim /etc/pacman.d/mirrorlist"

# -------------------------------------------
# Update Arch Mirrors
# -------------------------------------------
alias mirror="sudo reflector --verbose --latest 5 --protocol https --sort rate --save /etc/pacman.d/mirrorlist"

alias mirrorv="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

alias rate.arch="rate-mirrors --allow-root --protocol https arch | sudo tee /etc/pacman.d/mirrorlist"

# -------------------------------------------
# Configure EndeavourOS Mirror List
# -------------------------------------------
alias zxendeavouros.mirror="sudo vim /etc/pacman.d/endeavouros-mirrorlist"

# -------------------------------------------
# Configure Chaotic Mirror List
# -------------------------------------------
alias zxchaotic.mirror="sudo vim /etc/pacman.d/chaotic-mirrorlistt"

# -------------------------------------------
# Update Manjaro Mirrors
# -------------------------------------------
alias rate.manjaro="rate-mirrors --allow-root --protocol https manjaro | sudo tee /etc/pacman.d/mirrorlist"

# -------------------------------------------
# Update EndeavourOS mirror
# -------------------------------------------
alias rate.endeavouros="rate-mirrors --allow-root --protocol https endeavouros | sudo tee /etc/pacman.d/endeavouros-mirrorlist"

