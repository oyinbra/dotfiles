
#!/bin/zsh

cpu() {
  # Define an associative array with command names as keys and corresponding commands as values
  declare -A commands=(
    ["View CPU Stats"]="sudo auto-cpufreq --stats"
    ["Start Auto-CPUFreq"]="sudo auto-cpufreq --install"
    ["Stop Auto-CPUFreq"]="sudo auto-cpufreq --remove"
    ["Edit Auto-CPUFreq Config"]="sudo nvim /etc/auto-cpufreq.conf"
    ["Edit Optimus Manager Config"]="nvim /usr/share/optimus-manager.conf"
    ["Quit"]=": # Do nothing"
  )

  # Manually control the order of the options while still using the associative array for commands
  local ordered_options=(
    "View CPU Stats"
    "Start Auto-CPUFreq"
    "Stop Auto-CPUFreq"
    "Edit Auto-CPUFreq Config"
    "Edit Optimus Manager Config"
    "Quit"
  )

  # Use fzf to display the options and store the selection
  local choice=$(printf "%s\n" "${ordered_options[@]}" | fzf --height 10 --prompt "Select a command: " --border)

  # Execute the corresponding command based on the selection
  if [[ -n $choice ]]; then
    eval "${commands[$choice]}"
  else
    echo "Invalid option. Please choose a valid command."
  fi
}

