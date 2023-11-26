#!/bin/bash

cat << "EOF"
                 ____            _
 _ __ ___  _   _|  _ \ __ _  ___| | ____ _  __ _  ___  ___
| '_ ` _ \| | | | |_) / _` |/ __| |/ / _` |/ _` |/ _ \/ __|
| | | | | | |_| |  __/ (_| | (__|   < (_| | (_| |  __/\__ \
|_| |_| |_|\__, |_|   \__,_|\___|_|\_\__,_|\__, |\___||___/
           |___/                           |___/
EOF

# ------------------------------------------------------
# Load library from modules directory in Dotfiles
# ------------------------------------------------------
source $(dirname "$0")/modules/library.sh
clear

cat << "EOF"
 ___           _        _ _
|_ _|_ __  ___| |_ __ _| | |
 | || '_ \/ __| __/ _` | | |
 | || | | \__ \ || (_| | | |
|___|_| |_|___/\__\__,_|_|_|

EOF

# ------------------------------------------------------
# Confirm Start
# ------------------------------------------------------
confirm_start

packagesPacman=(
    "vivaldi"
    "fd"
    "figlet"
    "eza"
    "rofi-lbonn-wayland-git"
    # "rofi"
    "rofi-emoji"
    "rofi-calc"
    "git"
    "sxhkd"
    "webapp-manager"
    "expac"
    "dbeaver"
    "mysql-workbench"
    "marktext"
    "haruna"
    "electron"
    # "nvidia"
    # "nvidia-utils"
    # "nvidia-settings"
    "noto-fonts-emoji"
    "yarn"
    "sass"
    "zsh"
    "spotify"
    # "kdeplasma-addons"
    "grub-btrfs"
    # "microsoft-edge-dev-bin"
    # "slack-desktop"
    "zoom"
    "btrfs-progs"
    "cryptsetup"
    # "anaconda"
    "intellij-idea-community-edition"
    "auto-cpufreq"
    "wl-clipboard"
    "whatsapp-for-linux"
    "plasma-wayland-protocols"
    "npm"
    "spectacle"
    # "caffeine-ng"
    "zoxide"
    "fzf"
    "lazygit"
    "git"
    "appimagelauncher"
    "tree"
    "sublime-text-4"
    "vifm"
    "fd"
    "ripgrep"
    "gthumb"
    "firefox"
    "latte-dock"
    "nano-syntax-highlighting"
    "alacritty"
    "chromium"
    "obs-studio"
    "gparted"
    # "brave-bin"
    "jdk8-openjdk"
    "nodejs"
    "android-studio"
    "discord"
    "mailspring"
    "bitwarden"
    "freedownloadmanager"
    "notion-app-enhanced"
    "rust"
    "xclip"
    "duf"
    "btop"
    "ksysguard"
    # "onlyoffice-bin"
    "libreoffice-fresh"
    "gthumb"
    "clutter"
    "imath"
    "webkit2gtk"
    "neovim"
    "kitty"
    "cronie"
    "neovim-symlinks"
    "rate-mirrors"
    "bat"
    "firewalld"
    "python-pyqt5"
    "nethogs"
    "visual-studio-code-bin"
    "kdeconnect"
    "adobe-source-sans-pro-fonts"
    "aspell-en"
    "enchant"
    "gst-libav"
    "gst-plugins-good"
    "icedtea-web"
    "jre8-openjdk"
    "languagetool"
    "libmythes"
    "mythes-en"
    "ttf-anonymous-pro"
    "ttf-bitstream-vera"
    "ttf-dejavu"
    "ttf-droid"
    "ttf-liberation"
    "ttf-ubuntu-font-family"
);

packagesYay=(
    "preload"
    "tradingview"
);
  
# ------------------------------------------------------
# Install required packages
# ------------------------------------------------------
_installPackagesPacman "${packagesPacman[@]}";
_installPackagesYay "${packagesYay[@]}";


# ------------------------------------------------------
# Enable preload services
# ------------------------------------------------------
cat << "EOF"
                  _     _      ____           _                 _
  ___ _ __   __ _| |__ | | ___|  _ \ _ __ ___| | ___   __ _  __| |
 / _ \ '_ \ / _` | '_ \| |/ _ \ |_) | '__/ _ \ |/ _ \ / _` |/ _` |
|  __/ | | | (_| | |_) | |  __/  __/| | |  __/ | (_) | (_| | (_| |
 \___|_| |_|\__,_|_.__/|_|\___|_|   |_|  \___|_|\___/ \__,_|\__,_|

EOF
systemctl enable --now preload.service

