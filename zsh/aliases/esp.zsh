#!/bin/zsh

esp() {
  typeset -A commands=(
    ["📶 Check Espanso Status"]="espanso status"
    ["🚀 Start Espanso"]="espanso start"
    ["🛑 Stop Espanso"]="espanso stop"
    ["🔄 Restart Espanso"]="espanso restart"
    ["💀 Kill Espanso"]="pkill -9 espanso"
    ["📜 View Logs"]="espanso log"
    ["⚙️ Edit Config (nvim)"]="nvim ~/.config/espanso/config/default.yml"
    ["🧩 Edit Matches"]="nvim ~/.config/espanso/match/config.yml"
    ["🧵 Edit X Search Matches"]="nvim ~/.config/espanso/match/x_search.yml"
    ["📦 Edit Packages"]="nvim ~/.config/espanso/match/packages"
    ["🔧 Doctor (Debug)"]="espanso doctor"
    ["🔁 Reload Config"]="espanso restart"
    ["➕ Add New Trigger"]="add"
    ["🚪 Quit"]="return"
  )

  local choice=$(printf "%s\n" "${(@k)commands}" | fzf --height=14 --prompt="🧠  Espanso Menu: " --border)

  if [[ -n $choice ]]; then
    eval "${commands[$choice]}"
  else
    echo "❌ No option selected."
  fi
}

add() {
  echo "✏️ Copy and paste the new trigger entry below (in valid YAML format):"
  echo "Example:"
  echo "  - trigger: \";your_trigger\""
  echo "    replace: \"Your replacement text\""
  echo
  echo "➕ Paste below (press CTRL+D when done):"

  cat >> ~/.config/espanso/match/config.yml

  echo "✅ Trigger added. Run 'espanso restart' to apply changes."
}
