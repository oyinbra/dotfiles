#!/bin/sh
# Name on folder in .config directory
alias lazy="NVIM_APPNAME=LazyVim nvim"
alias kick="NVIM_APPNAME=KickStart nvim"
alias chad="NVIM_APPNAME=NvChad nvim"
alias astro="NVIM_APPNAME=AstroNvim nvim"

# vs function to switch between neovim configuration
function vs() {
  items=("default" "KickStart" "LazyVim" "NvChad" "AstroNvim")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}
# Bind ctrl+y to vs for neovim switcher
bindkey "^Y" vs
