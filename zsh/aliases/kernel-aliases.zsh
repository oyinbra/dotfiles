#!/bin/zsh

kernel() {
  # Define an associative array with command names as keys and corresponding commands as values
  declare -A commands=(
    ["Check current kernel version"]="uname -r"
    ["Check detailed kernel version"]="uname -a"
    ["List all installed kernels"]="pacman -Q | grep linux"
    ["Remove old kernels"]="sudo pacman -Rns $(pacman -Qdtq)"
    ["Update initramfs"]="sudo mkinitcpio -P"
    ["Update grub and initramfs"]="sudo grub-mkconfig -o /boot/grub/grub.cfg && sudo mkinitcpio -P"
    ["Install latest kernel"]="sudo pacman -Syu linux"
    ["Install Zen kernel"]="sudo pacman -S linux-zen linux-zen-headers"
    ["Install LTS kernel"]="sudo pacman -S linux-lts linux-lts-headers"
    ["Check kernel logs (dmesg)"]="dmesg | less"
    ["Quit"]=": # Do nothing"
  )

  # Use fzf to display the options and store the selection
  local choice=$(printf "%s\n" "${(@k)commands}" | fzf --height 10 --prompt "Select a kernel command: " --border)

  # Execute the corresponding command based on the selection
  if [[ -n $choice ]]; then
    eval "${commands[$choice]}"
  else
    echo "Invalid option. Please choose a valid command."
  fi
}

