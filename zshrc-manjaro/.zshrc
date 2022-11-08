# NEOFETCH
# neofetch --ascii ~/.mog.sh
neofetch --config ~/.neofetch-config2.conf

# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

# ZSH ALIASES
source ~/.zsh_aliases

# Set default Editor
export EDITOR=nvim

# Set default Terminal
export TERMINAL=tilix

# Tilix Terminal
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi
