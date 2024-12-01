#!/bin/zsh

mkinit() {
  # Define an associative array with command names as keys and corresponding commands as values
  declare -A commands=(
    ["Update/Generate initramfs"]="sudo mkinitcpio -P"
    ["Edit mkinitcpio Config"]="sudo nvim /etc/mkinitcpio.conf"
    ["List Available Hooks"]="ls /usr/lib/initcpio/hooks"
    ["List Installed Presets"]="ls /etc/mkinitcpio.d/"
    ["Quit"]=": # Do nothing"
  )

  # Use fzf to display the options and store the selection
  local choice=$(printf "%s\n" "${(@k)commands}" | fzf --height 10 --prompt "Select an mkinitcpio command: " --border)

  # Execute the corresponding command based on the selection
  if [[ -n $choice ]]; then
    eval "${commands[$choice]}"
  else
    echo "Invalid option. Please choose a valid command."
  fi
}

