#!/bin/zsh

dir() {
  # Define an associative array with directory names as keys and corresponding cd commands as values
  declare -A directories=(
    ["Config"]="cd ~/.config"
    ["Neovim Config"]="cd ~/.config/nvim"
    ["Dotfiles"]="cd ~/dotfiles"
    ["Hub"]="cd ~/Hub"
    ["Kitty Config"]="cd ~/.config/kitty/"
    ["Pacman Cache"]="cd /var/cache/pacman/pkg"
    ["Alacritty Config"]="cd ~/.config/alacritty/"
    ["Pictures"]="cd ~/Pictures"
    ["Aliases"]="cd ~/dotfiles/zsh/aliases"
    ["Zsh"]="cd ~/dotfiles/zsh"
  )

  # Use fzf to display the directory options and store the selection
  local choice=$(printf "%s\n" "${(@k)directories}" | fzf --height 10 --prompt "Select a directory: " --border)

  # Execute the corresponding cd command based on the selection
  if [[ -n $choice ]]; then
    eval "${directories[$choice]}"
  else
    echo "Invalid option. Please choose a valid directory."
  fi
}
