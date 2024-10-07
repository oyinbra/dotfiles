#!/bin/zsh

grub() {
  # Define an associative array with command names as keys and corresponding commands as values
  declare -A commands=(
    ["Update GRUB"]="sudo update-grub"
    ["Open GRUB directory"]="nvim /etc/default/grub"
    ["Quit"]=": # Do nothing"
  )

  # Use fzf to display the options and store the selection
  local choice=$(printf "%s\n" "${(@k)commands}" | fzf --height 10 --prompt "Select a GRUB command: " --border)

  # Execute the corresponding command based on the selection
  if [[ -n $choice ]]; then
    eval "${commands[$choice]}"
  else
    echo "Invalid option. Please choose a valid command."
  fi
}

