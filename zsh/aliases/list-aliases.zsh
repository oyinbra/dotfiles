#!/bin/zsh

l() {
  # Define an associative array with list commands
  declare -A commands=(
    ["All Files (with icons)"]="eza -a --icons=auto --sort=name --group-directories-first -1"
    ["Row View"]="eza -h --icons=auto"
    ["All Row View"]="eza -a --icons=auto --sort=name --group-directories-first"
    ["One Line"]="eza -1 --icons=auto"
    ["Details"]="eza -lh --icons=auto"
    ["All Details"]="eza -lha --icons=auto --sort=name --group-directories-first"
    ["Directories Only"]="eza -lhD --icons=auto"
  )

  # Use fzf to display the commands and store the selection
  local choice=$(printf "%s\n" "${(@k)commands}" | fzf --height 10 --prompt "Select a command: " --border)

  # Execute the selected command
  if [[ -n "$choice" ]]; then
    eval "${commands[$choice]}"
  else
    echo "No command selected. Exiting."
  fi
}
