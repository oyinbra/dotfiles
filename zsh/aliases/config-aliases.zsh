#!/bin/zsh

conf() {
  # Define an associative array with configuration file names as keys and corresponding commands as values
  declare -A configs=(
    ["Edit Auto-CPUFreq Config"]="nvim ~/Dotfiles/etc/auto-cpufreq.conf"
    ["Edit Alacritty Config"]="nvim ~/.config/alacritty/alacritty.yml"
    ["Edit Kitty Config"]="nvim ~/.config/kitty/kitty.conf"
    ["Edit GRUB Config"]="sudo nvim /etc/default/grub"
    ["Edit mkinitcpio Config"]="sudo nvim /etc/mkinitcpio.conf"
    ["Edit Pacman Config"]="sudo nvim /etc/pacman.conf"
    ["Edit Zsh Config"]="nvim ~/.config/zsh/conf/.zshrc"
    ["Edit Xinit Config"]="nvim ~/.xinitrc"
    ["Edit Bash Config"]="nvim ~/.bashrc"
    ["Edit Environment Variables"]="sudo nvim /etc/environment"
    ["Edit Hosts File"]="sudo nvim /etc/hosts"
    ["Edit FSTAB"]="sudo nvim /etc/fstab"
    ["Quit"]=": # Do nothing"
  )

  # Use fzf to display the options and store the selection
  local choice=$(printf "%s\n" "${(@k)configs}" | fzf --height 10 --prompt "Select a configuration file: " --border)

  # Execute the corresponding command based on the selection
  if [[ -n $choice ]]; then
    eval "${configs[$choice]}"
  else
    echo "Invalid option. Please choose a valid command."
  fi
}

