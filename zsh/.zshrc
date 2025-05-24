#!/bin/zsh

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
ZSH_PLUGIN_MANAGER="$HOME/.zsh/plugin-manager/init.zsh"
ENV_FILE="$HOME/.env"
ZSH_PLUGIN_DIR="$HOME/.zsh-plugins"
OMZ_PLUGIN_DIR="$HOME/.zsh-plugins/ohmyzsh/plugins"
P10K_CONFIG="$HOME/.p10k.zsh"

# -------------------------------------------------------
# Source username
# -------------------------------------------------------
figlet -f dosrebel "$(echo $USER | tr '[:lower:]' '[:upper:]' | head -c 1)${USER:1}" | lolcat

gsource=(
  # -----------------------------------------------------
  # Pugins from "$HOME/.zsh-plugins"
  # -----------------------------------------------------
  "zsh-users/zsh-autosuggestions" 
  "zsh-users/zsh-syntax-highlighting" # Syntax highlighting for Zsh
  "zsh-users/zsh-history-substring-search"
  "oyinbra/supercharge" # Supercharge Zsh with directory completions
  "oyinbra/ginit" # Supercharge git init
  "zap-zsh/vim" # Vim integration for Zsh
  "zap-zsh/fzf" # Fuzzy finder for Zsh
  "zap-zsh/sudo"
  "djui/alias-tips" # Display helpful alias usage tips
  "esc/conda-zsh-completion" # Conda Zsh completion
  "hlissner/zsh-autopair" # Zsh autopairs like double "", ()
  # "wintermi/zsh-fnm" #  fast and simple Node.js version manager

  # ----------------------------------------------------
  # Prompts for zsh
  # ----------------------------------------------------
  "romkatv/powerlevel10k"
  # "wintermi/zsh-starship"

  # ----------------------------------------------------
  # Pugins from OH-MY-ZSH DIR in "$HOME/.zsh-plugins"
  # ----------------------------------------------------
  # "ohmyzsh/ohmyzsh"
  "dirhistory"
  # "copyfile"
  # "copybuffer"
  # "history"
	)
export HISTTIMEFORMAT="%F %T "
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
# Function to source aliases and custom plugins
# -------------------------------------------------------
source "$ZSH_PLUGIN_MANAGER"
for file in "$ZSH_CONFIG_DIR/custom_plugins/"*.zsh; do source "$file"; done
for file in "$ZSH_CONFIG_DIR/aliases/"*.zsh; do source "$file"; done

# -------------------------------------------------------
# Function to suppress powerlevel 10 prompt if any
# -------------------------------------------------------
# typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# To customize prompt, run `p10k configure` or edit ~/dotfiles/zsh/.p10k.zsh.
[[ ! -f "$P10K_CONFIG" ]] || source "$P10K_CONFIG"

# eval "$(starship init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
