#!/bin/zsh

# NEOFETCH
neofetch --config ~/.neofetch-config2.conf

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Clone zplug if not present
function clone_zplug() {
  if [ ! -d "$HOME/.zplug" ]; then
    git clone https://github.com/zplug/zplug ~/.zplug
  fi
}

# Call the function to clone zplug if not present
clone_zplug
# Source zplug
source ~/.zplug/init.zsh
# history
HISTFILE=~/.zsh_history

# ZSH ALIASES
source "$HOME/.config/zsh/systemAliases.zsh"
source "$HOME/.config/zsh/gitAliases.zsh"
source "$HOME/.config/zsh/mirrorAliases.zsh"
source "$HOME/.config/zsh/packageManagerAliases.zsh"
# Environment Variables
source "$HOME/.env"
# Source Exports
source "$HOME/.config/zsh/exports.zsh"
# Source Power level 10k theme
source ~/.config/zsh/themes/powerlevel10k/powerlevel10k.zsh-theme
source ~/.config/zsh/plugins/sudo/sudo.plugin.zsh
source "$HOME/.config/zsh/plugins/web-search/web-search.plugin.zsh"
# copyfile file/location/you/need/to/copy
source "$HOME/.config/zsh/plugins/copyfile/copyfile.plugin.zsh"
# copy the text currently typed in the command line.
source "$HOME/.config/zsh/plugins/copybuffer/copybuffer.plugin.zsh"
 # alt + left or alt + right to navigate directory
source "$HOME/.config/zsh/plugins/dirhistory/dirhistory.plugin.zsh"
# hsi nvim will give all history command with nvim
source "$HOME/.config/zsh/plugins/history/history.plugin.zsh"
# source nvim switcher
source "$HOME/.config/zsh/nvim-switcher.zsh"

# plugins
zplug "esc/conda-zsh-completion"
zplug "zsh-users/zsh-autosuggestions"
zplug "hlissner/zsh-autopair"
zplug "zap-zsh/supercharge"
zplug "zap-zsh/vim"
zplug "zap-zsh/fzf"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "djui/alias-tips"
# zplug "plugins/git",   from:oh-my-zsh
# Load theme file
# zplug "dracula/zsh", as:theme
# keybinds
bindkey '^ ' autosuggest-accept

if command -v bat &> /dev/null; then
  alias cat="bat -pp --theme \"Visual Studio Dark+\"" 
  alias catt="bat --theme \"Visual Studio Dark+\"" 
fi

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
