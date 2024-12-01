#!/bin/zsh

alias aur="yay"

alias arch="sudo pacman -Syu"
# Install a package using (AUR helper)
alias deploy="yay -S"

# Remove a package using (AUR helper)
alias purge="yay -R"

# Upgrade/Install a package using a package file
alias pkg="yay -U"

# Check if a package is installed
alias check="yay -Q | grep"

# Search for packages using 'yay'
alias search="yay -Ss"

# Query installed packages with 'yay'
alias query="yay -Qs"

# Find the package providing a specific file with 'yay -F'
alias pacfind="yay -F"

# Remove orphan packages
alias pacremorphan="yay -R $(yay -Qtdq)"

# Downgrade a package using 'yay'
alias downgrade="yay -Suu"

pac() {
  # Define an associative array with package management commands that do not require user input
  declare -A commands=(
    ["Refresh file database"]="yay -Fy"
    ["Sync packages"]="yay -Syy"
    ["Clean package cache"]="yay -Sc"
    ["Remove old packages from cache"]="yay -c"
    ["Clean all package cache"]="yay -Scc"
    ["List cached packages"]="ls /var/cache/pacman/pkg | less"
    ["List orphan packages"]="yay -Qtdq"
    ["Display package dependencies (recursive)"]="pactree -r"
    ["Remove package and unneeded dependencies"]="yay -Rs"
    ["Remove package and dependencies"]="yay -Rns"
    ["Unlock pacman database"]="sudo rm -rf /var/lib/pacman/db.lck"
    ["View last installed packages"]='if [ -f /var/log/pacman.log ]; then expac --timefmt="%Y-%m-%d %T" "%l|%-30n|%-15d" $(zcat /var/log/pacman.log* 2>/dev/null | awk "/^\[.*\] installed/ {print \$1}") | sort | tail -n 100; else echo "Pacman log file not found or not in gzip format"; fi'
    ["Quit"]=": # Do nothing"
  )

  # Use fzf to display the package management commands and store the selection
  local choice=$(printf "%s\n" "${(@k)commands}" | fzf --height 10 --prompt "Select a package management command: " --border)

  # Execute the corresponding command based on the selection
  if [[ -n "$choice" ]]; then
    eval "${commands[$choice]}"
  else
    echo "Invalid option. Please choose a valid command."
  fi
}

