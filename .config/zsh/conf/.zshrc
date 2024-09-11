#!/bin/zsh

# ███ ███ █ █ ███ ███
#   █ █   █ █ █ █ █
#  █   █  ███ ██  █
# █     █ █ █ █ █ █
# ███ ███ █ █ █ █ ███

# -------------------------------------------------------
# Constants
# -------------------------------------------------------
ZPLUG_DIR="$HOME/.zplug"
ZPLUG_URL="https://github.com/zplug/zplug"
ZSH_HIS_DIR="$HOME/.zsh_history"
NEOFETCH_CONFIG="$HOME/.config/zsh/conf/neofetch-source/.neofetch-config.conf"
ZSH_CONFIG_DIR="$HOME/.config/zsh"
ZPLUG_INIT_FILE="$HOME/.zplug/init.zsh"
ENV_FILE="$HOME/.env"
# -------------------------------------------------------
# zsh History settings for auto suggestions
# -------------------------------------------------------
HISTFILE="$ZSH_HIS_DIR"
HISTSIZE=50000
SAVEHIST=50000

# -------------------------------------------------------
# Source username
# -------------------------------------------------------
figlet -f dosrebel "$(echo $USER | tr '[:lower:]' '[:upper:]' | head -c 1)${USER:1}" | lolcat
alias q="exit"

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
# Function to clone zplug if not present and clone it
# -------------------------------------------------------
clone_zplug() {
  if [ ! -d "$ZPLUG_DIR" ]; then
    if git clone "$ZPLUG_URL" "$ZPLUG_DIR"; then
      echo "Zplug cloned successfully."
    else
      echo "Error: Unable to clone Zplug. Exiting."
      exit 1
    fi
  fi
}

clone_zplug

# -------------------------------------------------------
# Function to load environment variables
# -------------------------------------------------------
load_environment() {
  if [ -f "$ENV_FILE" ]; then
    source "$ENV_FILE"
  else
    echo "Warning: $ENV_FILE not found. Consider creating it with your environment variables." >&2
  fi
}

load_environment

# -------------------------------------------------------
# Source zplug
# -------------------------------------------------------
source "$ZPLUG_INIT_FILE"

# -------------------------------------------------------
# Load plugins
# -------------------------------------------------------
zplug "esc/conda-zsh-completion" # Conda Zsh completion
zplug "zsh-users/zsh-autosuggestions" # Zsh autosuggestions like double "", 
zplug "hlissner/zsh-autopair" # Autopair for Zsh
zplug "zap-zsh/supercharge" # Supercharge Zsh with directory completions
zplug "zap-zsh/vim" # Vim integration for Zsh
zplug "zap-zsh/fzf" # Fuzzy finder for Zsh
zplug "zsh-users/zsh-syntax-highlighting" # Syntax highlighting for Zsh
zplug "djui/alias-tips" # Display helpful alias usage tips
zplug "ohmyzsh/ohmyzsh" # Display helpful alias usage tips

# -------------------------------------------------------
# Load Themes
# -------------------------------------------------------
zplug "romkatv/powerlevel10k", as:theme
# zplug "/zap-zsh/zap-prompt", as:theme
# zplug "dracula/zsh", as:theme

# -------------------------------------------------------
# Load plugins from ohmyzsh
# -------------------------------------------------------
# zplug "plugins/sudo", from:oh-my-zsh
# zplug "plugins/web-search", from:oh-my-zsh
# zplug "plugins/copyfile", from:oh-my-zsh # copyfile file/location/you/need/to/copy
# zplug "plugins/copybuffer", from:oh-my-zsh
# zplug "plugins/dirhistory", from:oh-my-zsh # alt + arrow key to navigate directory
# zplug "plugins/history", from:oh-my-zsh # hs/hsi nvim will give history command with nvim

# -------------------------------------------------------
# Load custom plugins from zsh directory in .config 
# -------------------------------------------------------
for file in "$ZSH_CONFIG_DIR/custom_plugins/"*.zsh; do
  source "$file"
done

# -------------------------------------------------------
# Bind the key combination Ctrl + Space to accept autosuggestions.
# -------------------------------------------------------
bindkey '^ ' autosuggest-accept

# -------------------------------------------------------
# Disables highlighting for paste operations.
# -------------------------------------------------------
zle_highlight=('paste:none')

# -------------------------------------------------------
# Display Pokemon color
# -------------------------------------------------------
# pokemon-colorscripts --no-title -r 1,3,6

# -------------------------------------------------------
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# -------------------------------------------------------
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

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
# Load zplug
# -------------------------------------------------------
 zplug load

# -------------------------------------------------------
# Load Aliases from zsh directory in .config
# -------------------------------------------------------
for file in "$ZSH_CONFIG_DIR/aliases/"*.zsh; do
  source "$file"
done

# -------------------------------------------------------
# Function to suppress powerlevel 10 prompt if any
# -------------------------------------------------------
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
