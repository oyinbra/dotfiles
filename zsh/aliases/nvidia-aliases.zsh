#!/bin/zsh

nvidia() {
  # Define an associative array with command names as keys and corresponding commands as values
  declare -A commands=(
    ["Check which GPU is currently in use (Nvidia or Intel)"]="prime-select query"
    ["Unload Nvidia modules (nvidia_modeset, nvidia_uvm, nvidia_drm, nvidia)"]="sudo rmmod nvidia_modeset nvidia_uvm nvidia_drm nvidia"
    ["Load Nvidia modules (nvidia, nvidia_modeset, nvidia_uvm, nvidia_drm)"]="sudo modprobe nvidia nvidia_modeset nvidia_uvm nvidia_drm"
    ["Switch to Intel GPU"]="sudo prime-select intel"
    ["Switch to Nvidia GPU"]="sudo prime-select nvidia"
    ["Turn off Nvidia GPU (bbswitch)"]="echo OFF | sudo tee /proc/acpi/bbswitch"
    ["Turn on Nvidia GPU (bbswitch)"]="echo ON | sudo tee /proc/acpi/bbswitch"
    ["Open Nvidia Settings"]="nvidia-settings"
    ["Install Nvidia Multiple Kernels"]="sudo pacman -S nvidia-dkms nvidia-settings"
    ["Install Nvidia drivers"]="sudo pacman -S nvidia nvidia-utils"
    ["Install Nvidia-Zen drivers"]="sudo pacman -S nvidia-zen nvidia-utils"
    ["Install Nvidia-LTS drivers"]="sudo pacman -S nvidia-lts nvidia-utils nvidia-settings"
    ["Quit"]=": # Do nothing"
  )

  # Use fzf to display the options and store the selection
  local choice=$(printf "%s\n" "${(@k)commands}" | fzf --height 10 --prompt "Select a Nvidia command: " --border)

  # Execute the corresponding command based on the selection
  if [[ -n $choice ]]; then
    eval "${commands[$choice]}"
  else
    echo "Invalid option. Please choose a valid command."
  fi
}
