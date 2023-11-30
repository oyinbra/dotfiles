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
ENV_FILE="$HOME/.env"
ZSH_PLUGINS_DIR="$HOME/.zsh-plugins"

# -------------------------------------------------------
# Source username
# -------------------------------------------------------
figlet -f dosrebel "$(echo $USER | tr '[:lower:]' '[:upper:]' | head -c 1)${USER:1}" | lolcat

# -------------------------------------------------------
# Define an array of plugin paths
# -------------------------------------------------------
plugins=(
    "zsh-history-substring-search/zsh-history-substring-search.plugin.zsh"
    "zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh"
    "zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"
    "alias-tips/alias-tips.plugin.zsh"
    "conda-zsh-completion/conda-zsh-completion.plugin.zsh"
    "fzf/fzf.plugin.zsh"
    "powerlevel10k/powerlevel10k.zsh-theme"
    "sudo/sudo.plugin.zsh"
    "supercharge/supercharge.plugin.zsh"
    "vim/vim.plugin.zsh"
    "web-search/web-search.plugin.zsh"
    "zap-prompt/zap-prompt.zsh-theme"
    "zsh-autopair/autopair.plugin.zsh"
    "ohmyzsh/plugins/copybuffer/copybuffer.plugin.zsh"
    "ohmyzsh/plugins/copyfile/copyfile.plugin.zsh"
    "ohmyzsh/plugins/dirhistory/dirhistory.plugin.zsh"
    "ohmyzsh/plugins/history/history.plugin.zsh"
)
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
# Load plugins
# -------------------------------------------------------
for plugin in "${plugins[@]}"; do
    source "$ZSH_PLUGINS_DIR/$plugin"
done

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
