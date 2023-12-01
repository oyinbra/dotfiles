#!/bin/bash

# ███ ███ █ █ ███ ███
#   █ █   █ █ █ █ █
#  █   █  ███ ██  █
# █     █ █ █ █ █ █
# ███ ███ █ █ █ █ ███

# -------------------------------------------------------
# Constants
# -------------------------------------------------------
NEOFETCH_CONFIG="$HOME/.zsh/.neofetch-config.conf"
ZSH_CONFIG_DIR="$HOME/.zsh"
ENV_FILE="$HOME/.env"
ZSH_PLUGIN_DIR="$HOME/.zsh-plugins"
OMZ_PLUGIN_DIR="$HOME/.zsh-plugins/ohmyzsh/plugins"
ZSH_PLUGIN_MANAGER="$HOME/.zsh/plugin-manager/init.zsh"

# -------------------------------------------------------
# Source username
# -------------------------------------------------------
figlet -f dosrebel "$(echo $USER | tr '[:lower:]' '[:upper:]' | head -c 1)${USER:1}" | lolcat

plugins=(
  # -----------------------------------------------------
  # Pugins from "$HOME/.zsh-plugins"
  # -----------------------------------------------------
	"oyinbra/supercharge"
	# "zap-zsh/satoshi-prompt"
  "zsh-users/zsh-history-substring-search"
  "esc/conda-zsh-completion" # Conda Zsh completion
  "zsh-users/zsh-autosuggestions" 
  "hlissner/zsh-autopair" # Zsh autopairs like double "", ()
  "oyinbra/supercharge" # Supercharge Zsh with directory completions
  "zap-zsh/vim" # Vim integration for Zsh
  "zap-zsh/fzf" # Fuzzy finder for Zsh
  "zap-zsh/sudo"
  "zap-zsh/web-search"
  "zsh-users/zsh-syntax-highlighting" # Syntax highlighting for Zsh
  "djui/alias-tips" # Display helpful alias usage tips
  "romkatv/powerlevel10k"
  "zsh-users/zsh-autosuggestions"
  # ----------------------------------------------------
  # Pugins from OH-MY-ZSH DIR in "$HOME/.zsh-plugins"
  # ----------------------------------------------------
  # "ohmyzsh/ohmyzsh"
  "dirhistory"
  # "copyfile"
  # "copybuffer"
  # "history"
	)

# -------------------------------------------------------
# NEOFETCH
# -------------------------------------------------------
# neofetch --config "$NEOFETCH_CONFIG"

# -------------------------------------------------------
# Enable Powerlevel10k instant prompt.
# -------------------------------------------------------
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# -------------------------------------------------------
# 'Ctrl + Space' key combination to accept autosuggestions
# -------------------------------------------------------
bindkey '^ ' autosuggest-accept

# -------------------------------------------------------
# Set the zle_highlight style for paste to 'none'
# -------------------------------------------------------
zle_highlight=('paste:none')

# -------------------------------------------------------
# Function to source aliases and custom plugins
# -------------------------------------------------------
source "$ZSH_PLUGIN_MANAGER"
for file in "$ZSH_CONFIG_DIR/custom_plugins/"*.zsh; do source "$file"; done
for file in "$ZSH_CONFIG_DIR/aliases/"*.zsh; do source "$file"; done
alias q="exit"
alias ezsh="exec zsh"
alias v="nvim"

# -------------------------------------------------------
# Function to suppress powerlevel 10 prompt if any
# -------------------------------------------------------
# typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# To customize prompt, run `p10k configure` or edit ~/dotfiles/zsh/.p10k.zsh.
[[ ! -f "$ZSH_CONFIG_DIR/.p10k.zsh" ]] || source "$ZSH_CONFIG_DIR/.p10k.zsh"

