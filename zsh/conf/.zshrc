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
NEOFETCH_CONFIG="$HOME/.neofetch-config2.conf"
ZSH_CONFIG_DIR="$HOME/.config/zsh"
ZSH_ADDONS_DIR="$HOME/.config/zsh-addons"
ZPLUG_URL="https://github.com/zplug/zplug"
ZSH_AUTOSUGGESTIONS_URL="https://github.com/zsh-users/zsh-autosuggestions"
POWERLEVEL10K_URL="https://github.com/romkatv/powerlevel10k.git"
ZPLUG_URL="https://github.com/zplug/zplug"
ZPLUG_INIT_FILE="$HOME/.zplug/init.zsh"
ENV_FILE="$HOME/.env"

# -------------------------------------------------------
# zsh History settings for auto suggestions
# -------------------------------------------------------
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# -------------------------------------------------------
# Source username
# -------------------------------------------------------
source "$HOME/Dotfiles/zsh/p10k-user/username.zsh"

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
# Function to clone powerlevel10k and clone it
# -------------------------------------------------------
clone_powerlevel10k() {
  if [ ! -d "$ZSH_ADDONS_DIR/powerlevel10k" ]; then
    git clone "$POWERLEVEL10K_URL" "$ZSH_ADDONS_DIR/powerlevel10k"
  fi
}

clone_powerlevel10k

# -------------------------------------------------------
# Function to clone zsh-autosuggestions
# -------------------------------------------------------
clone_zsh_autosuggestions() {
  if [ ! -d "$ZSH_ADDONS_DIR/zsh-autosuggestions" ]; then
    git clone "$ZSH_AUTOSUGGESTIONS_URL" "$ZSH_ADDONS_DIR/zsh-autosuggestions"
  fi
}

clone_zsh_autosuggestions

# -------------------------------------------------------
# Function to install plugins with zplug installer
# -------------------------------------------------------
install_plugins() {
  zplug "esc/conda-zsh-completion" # Conda Zsh completion
  zplug "zsh-users/zsh-autosuggestions" # Zsh autosuggestions like double "", ()
  zplug "hlissner/zsh-autopair" # Autopair for Zsh
  # zplug "zap-zsh/supercharge" # Supercharge Zsh with directory completions
  zplug "zap-zsh/vim" # Vim integration for Zsh
  zplug "zap-zsh/fzf" # Fuzzy finder for Zsh
  zplug "zsh-users/zsh-syntax-highlighting" # Syntax highlighting for Zsh
  zplug "djui/alias-tips" # Display helpful alias usage tips
}

# -------------------------------------------------------
# Function to source custom plugins
# -------------------------------------------------------
source_plugins() {
  source "$ZSH_CONFIG_DIR/plugins/sudo/sudo.plugin.zsh"
  source "$ZSH_CONFIG_DIR/plugins/web-search/web-search.plugin.zsh"
  # copyfile file/location/you/need/to/copy
  source "$ZSH_CONFIG_DIR/plugins/copyfile/copyfile.plugin.zsh"
  # copy the text currently typed in the command line.
  source "$ZSH_CONFIG_DIR/plugins/copybuffer/copybuffer.plugin.zsh"
  # alt + left or alt + right to navigate directory
  source "$ZSH_CONFIG_DIR/plugins/dirhistory/dirhistory.plugin.zsh"
  # hs/hsi nvim will give all history command with nvim
  source "$ZSH_CONFIG_DIR/plugins/history/history.plugin.zsh"
  for file in "$ZSH_CONFIG_DIR/plugins/custom/"*.zsh; do source "$file"; done

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
# Source plugins
# -------------------------------------------------------
source_plugins

# -------------------------------------------------------
# install plugins
# -------------------------------------------------------
install_plugins

# -------------------------------------------------------
# Zsh addons
# -------------------------------------------------------
source "$ZSH_ADDONS_DIR/powerlevel10k/powerlevel10k.zsh-theme"
source "$ZSH_ADDONS_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh"

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
# Function to source aliases
# -------------------------------------------------------
for file in "$ZSH_CONFIG_DIR/conf/"*.zsh; do source "$file"; done

# -------------------------------------------------------
# Function to suppress powerlevel 10 prompt if any
# -------------------------------------------------------
# typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# -------------------------------------------------------
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# -------------------------------------------------------
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

