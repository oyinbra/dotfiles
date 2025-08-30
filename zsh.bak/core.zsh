# ============================================================================
# Shared Zsh Config (core.zsh)
# Loaded by all users: oyins, egbesu, root
# ============================================================================

# ----------------------------------------------------------------------------
# Base plugin directory (overrideable per user)
# ----------------------------------------------------------------------------
export ZBASE="${ZBASE:-$HOME/.zsh}"

# ----------------------------------------------------------------------------
# History settings
# ----------------------------------------------------------------------------
export HISTTIMEFORMAT="%F %T"
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000

# ----------------------------------------------------------------------------
# Optional .env loading (guarded)
# ----------------------------------------------------------------------------
export ENV_FILE="$HOME/.env"
[[ -f "$ENV_FILE" ]] && source "$ENV_FILE"

# ----------------------------------------------------------------------------
# Load plugin manager
# ----------------------------------------------------------------------------
[[ -f "$ZBASE/plugin-manager/init.zsh" ]] && source "$ZBASE/plugin-manager/init.zsh"

# ----------------------------------------------------------------------------
# Load aliases (safe glob)
# ----------------------------------------------------------------------------
alias_dir="$ZBASE/aliases"
[[ -d "$alias_dir" ]] && for f in "$alias_dir"/*.zsh(N); do source "$f"; done

# ----------------------------------------------------------------------------
# Load custom plugin functions (safe glob)
# ----------------------------------------------------------------------------
plugin_dir="$ZBASE/custom_plugins"
[[ -d "$plugin_dir" ]] && for f in "$plugin_dir"/*.zsh(N); do source "$f"; done

# ----------------------------------------------------------------------------
# Enable Zsh completion
# ----------------------------------------------------------------------------
autoload -Uz compinit && compinit

# ----------------------------------------------------------------------------
# Optional banner using figlet + lolcat
# ----------------------------------------------------------------------------
fig_dir="$HOME/dotfiles/usr/share/figlet"
if command -v figlet >/dev/null && [[ -d "$fig_dir" ]]; then
  figlet -d "$fig_dir" -f dosrebel "$(echo $USER | tr '[:lower:]' '[:upper:]' | head -c 1)${USER:1}" | lolcat
fi

