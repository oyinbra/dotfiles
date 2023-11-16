#!/bin/zsh

#                 ██
#                ░██
#  ██████  ██████░██      ██████  █████
# ░░░░██  ██░░░░ ░██████ ░░██░░█ ██░░░██
#    ██  ░░█████ ░██░░░██ ░██ ░ ░██  ░░
#   ██    ░░░░░██░██  ░██ ░██   ░██   ██
#  ██████ ██████ ░██  ░██░███   ░░█████
# ░░░░░░ ░░░░░░  ░░   ░░ ░░░     ░░░░░

cat << "EOF"

    ███████                ███             █████
  ███░░░░░███             ░░░             ░░███
 ███     ░░███ █████ ████ ████  ████████   ░███████  ████████   ██████
░███      ░███░░███ ░███ ░░███ ░░███░░███  ░███░░███░░███░░███ ░░░░░███
░███      ░███ ░███ ░███  ░███  ░███ ░███  ░███ ░███ ░███ ░░░   ███████
░░███     ███  ░███ ░███  ░███  ░███ ░███  ░███ ░███ ░███      ███░░███
 ░░░███████░   ░░███████  █████ ████ █████ ████████  █████    ░░████████
   ░░░░░░░      ░░░░░███ ░░░░░ ░░░░ ░░░░░ ░░░░░░░░  ░░░░░      ░░░░░░░░
                ███ ░███
               ░░██████
                ░░░░░░

EOF


# -------------------------------------------------------
# Constants
# -------------------------------------------------------
ZPLUG_DIR="$HOME/.zplug"
NEOFETCH_CONFIG="$HOME/.neofetch-config2.conf"
ZSH_CONFIG_DIR="$HOME/.config/zsh"
ZPLUG_URL="https://github.com/zplug/zplug"
ZPLUG_INIT_FILE="$HOME/.zplug/init.zsh"
ENV_FILE="$HOME/.env"

# -------------------------------------------------------
# Function to clone zplug if not present
# -------------------------------------------------------
clone_zplug() {
  if [ ! -d "$ZPLUG_DIR" ]; then
    git clone "$ZPLUG_URL" "$ZPLUG_DIR"
  fi
}

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

# -------------------------------------------------------
# Function to source aliases
# -------------------------------------------------------
source_aliases() {
  source "$ZSH_CONFIG_DIR/conf/sysAliases.zsh"
  source "$ZSH_CONFIG_DIR/conf/gitAliases.zsh"
  source "$ZSH_CONFIG_DIR/conf/mirrorAliases.zsh"
  source "$ZSH_CONFIG_DIR/conf/pacMgrAliases.zsh"
  source "$ZSH_CONFIG_DIR/conf/langAliases.zsh"
  source "$ZSH_CONFIG_DIR/conf/exports.zsh"
  source "$ZSH_CONFIG_DIR/conf/nvim-switcher.zsh"
  source "$ZSH_CONFIG_DIR/themes/powerlevel10k/powerlevel10k.zsh-theme"
  source "$ZSH_CONFIG_DIR/plugins/sudo/sudo.plugin.zsh"
  source "$ZSH_CONFIG_DIR/plugins/web-search/web-search.plugin.zsh"
  # copyfile file/location/you/need/to/copy
  source "$ZSH_CONFIG_DIR/plugins/copyfile/copyfile.plugin.zsh"
  # copy the text currently typed in the command line.
  source "$ZSH_CONFIG_DIR/plugins/copybuffer/copybuffer.plugin.zsh"
  # alt + left or alt + right to navigate directory
  source "$ZSH_CONFIG_DIR/plugins/dirhistory/dirhistory.plugin.zsh"
  # hsi nvim will give all history command with nvim
  source "$ZSH_CONFIG_DIR/plugins/history/history.plugin.zsh"
}

# -------------------------------------------------------
# Function to source plugins
# -------------------------------------------------------
source_plugins() {
  zplug "esc/conda-zsh-completion"
  zplug "esc/conda-zsh-completion"
  zplug "zsh-users/zsh-autosuggestions"
  zplug "hlissner/zsh-autopair"
  zplug "zap-zsh/supercharge"
  zplug "zap-zsh/vim"
  zplug "zap-zsh/fzf"
  zplug "zsh-users/zsh-syntax-highlighting"
  zplug "djui/alias-tips"
}

# -------------------------------------------------------
# Main script
# -------------------------------------------------------

# NEOFETCH
neofetch --config "$NEOFETCH_CONFIG"

# Enable Powerlevel10k instant prompt.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Clone zplug if not present
clone_zplug

# Source zplug
source "$ZPLUG_INIT_FILE"

# Source other configurations
source_aliases

# Source plugins
source_plugins

# Load environment variables
load_environment

# Source Power level 10k theme
source "$ZSH_CONFIG_DIR/themes/powerlevel10k/powerlevel10k.zsh-theme"
# Add other theme sources here

# keybinds
bindkey '^ ' autosuggest-accept

zle_highlight=('paste:none')

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [Y/n]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
