#!/bin/bash

cat << "EOF"

███ ███ █ █   ███ ███ ███ █ █ ███
  █ █   █ █   █   █    █  █ █ █ █
 █   █  ███    █  ███  █  █ █ ███
█     █ █ █     █ █    █  █ █ █
███ ███ █ █   ███ ███  █  ███ █

EOF

# -----------------------------------------
# Confirm start
# -----------------------------------------
confirm_start() {
    while true; do
        read -p "DO YOU WANT TO PROCEED (Yy/Nn): " yn
        case $yn in
            [Yy]* ) echo "Started."; break;;
            [Nn]* ) exit;;
            * ) echo "Please answer yes or no.";;
        esac
    done
}

# -----------------------------------------
# Check if a package is installed
# -----------------------------------------
_isInstalledPacman() {
    pacman -Q "$1" &>/dev/null && echo 0 || echo 1
}

# -----------------------------------------
# Install packages via pacman
# -----------------------------------------
_installPackagesPacman() {
    local toInstall=()
    for pkg in "$@"; do
        if [[ $(_isInstalledPacman "$pkg") == 0 ]]; then
            echo "✔️ $pkg is already installed."
        else
            toInstall+=("$pkg")
        fi
    done
    if (( ${#toInstall[@]} )); then
        echo "📦 Installing: ${toInstall[*]}"
        sudo pacman -S --noconfirm "${toInstall[@]}"
    fi
}

# -----------------------------------------
# Safer symlink creation
# -----------------------------------------
_installSymLink() {
    local name="$1"
    local source_path="$2"
    local target_path="$3"

    if [ ! -e "$source_path" ]; then
        echo "❌ Source $source_path does not exist. Skipping $name."
        return
    fi

    echo -e "\n🔗 Installing $name"
    echo "From: $source_path"
    echo "To:   $target_path"

    if [ -L "$target_path" ]; then
        echo "⚠️  Existing symlink at $target_path. Replacing..."
        rm "$target_path"
    elif [ -e "$target_path" ]; then
        echo "⚠️  $target_path exists and is NOT a symlink."
        read -p "Do you want to replace it? (y/N): " confirm
        if [[ "$confirm" =~ ^[Yy]$ ]]; then
            rm -rf "$target_path"
        else
            echo "⏭️  Skipped $target_path"
            return
        fi
    fi

    ln -s "$source_path" "$target_path"
    echo "✅ Linked $target_path → $source_path"
}

# -----------------------------------------
# Entry
# -----------------------------------------
confirm_start
clear

# -----------------------------------------
# Install required packages
# -----------------------------------------
packagesPacman=("zsh" "npm" "zoxide" "fzf")
_installPackagesPacman "${packagesPacman[@]}"
clear

# -----------------------------------------
# Ensure ~/.config exists
# -----------------------------------------
if [ ! -d "$HOME/.config" ]; then
    mkdir -p "$HOME/.config"
    echo "📁 Created ~/.config"
fi

# -----------------------------------------
# User-level zsh config
# -----------------------------------------
_installSymLink ".zshrc" "$HOME/dotfiles/zsh/.zshrc" "$HOME/.zshrc"
_installSymLink "zsh config" "$HOME/dotfiles/zsh" "$HOME/.zsh"

# -----------------------------------------
# Root-level zsh config
# -----------------------------------------
_installSymLink "root .zshrc" "$HOME/dotfiles/zsh/.zshrc" "/root/.zshrc"
_installSymLink "root zsh" "$HOME/dotfiles/zsh" "/root/.zsh"
_installSymLink "root .env" "$HOME/.env" "/root/.env"
_installSymLink "root plugins" "$HOME/.zsh-plugins" "/root/zsh-plugins"
_installSymLink "root .p10k.zsh" "$HOME/dotfiles/zsh/p10k-root/.p10k.zsh" "/root/.p10k"

# -----------------------------------------
# Neofetch link
# -----------------------------------------
_installSymLink "neofetch" "$HOME/dotfiles/zsh/usr/bin/neofetch" "/usr/bin/neofetch"
clear

# -----------------------------------------
# Shell switching
# -----------------------------------------
# if [ "$SHELL" = "/bin/zsh" ]; then
#     echo "💡 Shell is already Zsh."
# else
#     read -p "Do you want to change your shell to Zsh? (y/n, default: n): " choice
#     choice=${choice:-n}
#     if [[ "$choice" =~ ^[Yy]$ ]]; then
#         chsh -s /bin/zsh "$USER"
#         echo "✅ Shell changed to Zsh."
#     else
#         echo "ℹ️ Shell remains unchanged."
#     fi
# fi

# # -----------------------------------------
# # Option to log into Zsh now
# # -----------------------------------------
# read -p "DO YOU WANT TO LOG INTO ZSH NOW? (y/n): " answer
# [[ "$answer" =~ ^[Yy]$ ]] && exec zsh || echo "Skipped Zsh login."

# -----------------------------------------
# Restore figlet fonts
# -----------------------------------------
if [ -d "$HOME/dotfiles/usr/share/figlet" ]; then
    sudo cp -r "$HOME/dotfiles/usr/share/figlet/"* /usr/share/figlet/fonts/
    echo "🖋️ Figlet fonts restored."
else
    echo "⚠️  No figlet fonts found to restore."
fi

# -----------------------------------------
# Done
# -----------------------------------------
cat << "EOF"

██  ███ █   █ ███
█ █ █ █ ██  █ █
█ █ █ █ █ █ █ ███
█ █ █ █ █  ██ █
██  ███ █   █ ███

EOF
