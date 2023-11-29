#!/bin/zsh

# ███ ███ █ █ ███ ███
#   █ █   █ █ █ █ █
#  █   █  ███ ██  █
# █     █ █ █ █ █ █
# ███ ███ █ █ █ █ ███

# -------------------------------------------------------
# Use zap zshrc
# -------------------------------------------------------
# source ~/.zshrc.zap && return

# -------------------------------------------------------
# Use plugless zshrc
# -------------------------------------------------------
source ~/.zshrc.plugless && return

# -------------------------------------------------------
# Constants
# -------------------------------------------------------
ZPLUG_DIR="$HOME/.zplug"
NEOFETCH_CONFIG="$HOME/.neofetch-config.conf"
ZSH_CONFIG_DIR="$HOME/.zsh"
ZPLUG_URL="https://github.com/zplug/zplug"
ZPLUG_INIT_FILE="$HOME/.zplug/init.zsh"
ENV_FILE="$HOME/.env"

# -------------------------------------------------------
# Source username
# -------------------------------------------------------
# figlet -f dosrebel "$(echo $USER | tr '[:lower:]' '[:upper:]' | head -c 1)${USER:1}" | lolcat
figlet -f dosrebel "ZPL" | lolcat

# -------------------------------------------------------
# Function to clone zplug if not present and clone it
# -------------------------------------------------------
clone_zplug() {
  if [ ! -d "$ZPLUG_DIR" ]; then
    git clone "$ZPLUG_URL" "$ZPLUG_DIR"
  fi
}

clone_zplug

# -------------------------------------------------------
# Function to install plugins with zplug installer
# -------------------------------------------------------
install_plugins() {
  zplug "zsh-users/zsh-history-substring-search", as:plugin
  zplug "esc/conda-zsh-completion", defer:"3" # Conda Zsh completion
  zplug "zsh-users/zsh-autosuggestions" 
  zplug "hlissner/zsh-autopair" # Zsh autopairs like double "", ()
  zplug "oyinbra/supercharge" # Supercharge Zsh with directory completions
  zplug "zap-zsh/vim" # Vim integration for Zsh
  zplug "zap-zsh/fzf" # Fuzzy finder for Zsh
  zplug "zap-zsh/sudo", defer:"2"
  zplug "zap-zsh/web-search", defer:"3" 
  zplug "zsh-users/zsh-syntax-highlighting" # Syntax highlighting for Zsh
  zplug "djui/alias-tips", defer:"2" # Display helpful alias usage tips
  # zplug 'dracula/zsh', as:theme
  zplug "romkatv/powerlevel10k", as:theme
  zplug "zsh-users/zsh-autosuggestions"
  zplug "ohmyzsh/ohmyzsh", defer:"3"
  zplug "plugins/copyfile", from:oh-my-zsh, defer:"3" 
  zplug "plugins/copybuffer", from:oh-my-zsh, defer:"3" 
  zplug "plugins/dirhistory", from:oh-my-zsh, defer:"3" 
  zplug "plugins/history", from:oh-my-zsh, defer:"3" 
}

# -------------------------------------------------------
# NEOFETCH
# -------------------------------------------------------
neofetch --config "$NEOFETCH_CONFIG"

# -------------------------------------------------------
# Enable Powerlevel10k instant prompt.
# -------------------------------------------------------
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# -------------------------------------------------------
# Source zplug
# -------------------------------------------------------
source "$ZPLUG_INIT_FILE"

# -------------------------------------------------------
# install plugins
# -------------------------------------------------------
install_plugins

# -------------------------------------------------------
# keybinds
# -------------------------------------------------------
bindkey '^ ' autosuggest-accept

zle_highlight=('paste:none')

# -------------------------------------------------------
# Install plugins if there are plugins that have not been installed
# -------------------------------------------------------
if ! zplug check --verbose; then
    printf "Install? [Y/n]: "
    if read -q; then
        echo; zplug install
    fi
fi

# -------------------------------------------------------
# Then, source plugins and add commands to $PATH
# -------------------------------------------------------
zplug load

# Display Pokemon color
# pokemon-colorscripts --no-title -r 1,3,6

# -------------------------------------------------------
# Function to source aliases and custom plugins
# -------------------------------------------------------
for file in "$ZSH_CONFIG_DIR/custom_plugins/"*.zsh; do source "$file"; done
for file in "$ZSH_CONFIG_DIR/aliases/"*.zsh; do source "$file"; done
alias q="exit"
alias ezsh="exec zsh"
alias v="nvim"

# -------------------------------------------------------
# Function to suppress powerlevel 10 prompt if any
# -------------------------------------------------------
# typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# -------------------------------------------------------
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# -------------------------------------------------------
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# To customize prompt, run `p10k configure` or edit ~/dotfiles/zsh/.p10k.zsh.
[[ ! -f "$ZSH_CONFIG_DIR/.p10k.zsh" ]] || source "$ZSH_CONFIG_DIR/.p10k.zsh"
