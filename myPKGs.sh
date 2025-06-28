#!/bin/bash

cat << "EOF"

█   █ █ █   ███ ███ ███ █ █ ███ ███ ███ ███
██ ██ █ █   █ █ █ █ █   █ █ █ █ █   █   █
█ █ █  █    ███ █ █ █   ██  █ █ █   ███  █
█   █  █    █   ███ █   █ █ ███ █ █ █     █
█   █  █    █   █ █ ███ █ █ █ █ ███ ███ ███

EOF

# ------------------------------------------------------
# Load library from modules directory in Dotfiles
# ------------------------------------------------------
source $(dirname "$0")/modules/library.sh
clear

cat << "EOF"

███ █   █ ███ ███ ███ █   █
 █  ██  █ █    █  █ █ █   █
 █  █ █ █  █   █  █ █ █   █
 █  █  ██   █  █  ███ █   █
███ █   █ ███  █  █ █ ███ ███

EOF

# ------------------------------------------------------
# Confirm Start
# ------------------------------------------------------
# confirm_start
confirm_start() {
    read -p "Proceed with package installation? [y/N]: " choice
    [[ "$choice" == [Yy]* ]] || exit 1
}

packagesPacman=(
    "deluge"
    "obsidian"
    "deluge-gtk"
    "noto-fonts-emoji"
    # "gnome-characters"
    # "openoffice-bin"
    # "freeoffice"
    # "wine"
    "xf86-video-intel"
    "mesa"
    # "wine-gecko"
    # "winetricks"
    # "wine-mono"
    # "bottle"
    # "transmission-qt"
    # "qbittorrent"
    # "aria2"
    "vivaldi"
    "lolcat"
#   "timeshift-autosnap"
    "at"
#   "eos-update-notifier"
    "seahorse"
    "fd"
    "figlet"
    "eza"
# 3   "rofi-lbonn-wayland-git"
    # "rofi"
    "rofi-emoji"
    "rofi-calc"
    "git"
    "sxhkd"
    "webapp-manager"
    "expac"
  # "dbeaver"
  # "mysql-workbench"
#   "marktext"
    "haruna"
    "electron"
    # "nvidia-open"
    # "nvidia-utils"
    # "nvidia-settings"
    # "cuda"
    "yarn"
    "sass"
    "zsh"
    # "spotify"
    # "kdeplasma-addons"
    "grub-btrfs"
    # "microsoft-edge-dev-bin"
    # "slack-desktop"
#   "zoom"
    "btrfs-progs"
    "cryptsetup"
    # "anaconda"
#   "intellij-idea-community-edition"
#   "auto-cpufreq"
    "deja-dup"
    "wl-clipboard"
    # "whatsapp-for-linux"
    "plasma-wayland-protocols"
    "npm"
    "spectacle"
#   "caffeine-ng"
    "zoxide"
    "fzf"
    "lazygit"
    "git"
    "appimagelauncher"
    "tree"
#   "sublime-text-4"
    "vifm"
    "fd"
    "ripgrep"
    "gthumb"
    "firefox"
#   "latte-dock"
    "nano-syntax-highlighting"
#   "alacritty"
    # "chromium"
    # "obs-studio"
    "gparted"
    # "brave-bin"
#   "jdk8-openjdk"
    "nodejs"
    # "android-studio"
#   "discord"
#   "mailspring"
#   "bitwarden"
    "freedownloadmanager"
#   "notion-app-enhanced"
    "rust"
    "xclip"
    "duf"
    "btop"
  "ksysguard"
    # "onlyoffice-bin"
#   "libreoffice-fresh"
#   "gthumb"
    "clutter"
    "imath"
    "webkit2gtk"
    "neovim"
    "kitty"
    "cronie"
    "neovim-symlinks"
    "pgadmin4-desktop"
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
#   "jre8-openjdk"
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
    # "webtorrent-cli"
    "mechvibes"
    # "frostwire"
    # "preload"
    # "tradingview"
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
▄▖▖ ▖▄▖▄ ▖ ▄▖  ▄▖▄▖▄▖▖ ▄▖▄▖▄ ▄▖  ▖▖ ▌▖ ▖
▙▖▛▖▌▌▌▙▘▌ ▙▖  ▙▌▙▘▙▖▌ ▌▌▌▌▌▌▗▘  ▌▌▐ ▛▖▌
▙▖▌▝▌▛▌▙▘▙▖▙▖  ▌ ▌▌▙▖▙▖▙▌▛▌▙▘▗   ▐ ▞ ▌▝▌
                                   ▘
EOF

confirm_execution systemctl enable --now preload.service

# ------------------------------------------------------
# Enable and configure firewalld
# ------------------------------------------------------
sudo systemctl enable --now firewalld
sudo systemctl start firewalld
sudo firewall-cmd --state
sudo ufw disable
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --reload
sudo firewall-cmd --list-services
sudo firewall-cmd --permanent --zone=public --add-service=kdeconnect
sudo firewall-cmd --reload

# ------------------------------------------------------
# Stop reboot watchdog on boot
# ------------------------------------------------------
echo "RebootWatchdogSec=0" | sudo tee --append "/etc/systemd/system.conf"

# ------------------------------------------------------
# Reduce swappiness to 10
# ------------------------------------------------------
echo "vm.swappiness=10" | sudo tee --append "/etc/sysctl.d/99-swappiness.conf"

# ------------------------------------------------------
# Reload the sysctl configuration
# ------------------------------------------------------
sudo systemctl daemon-reload

# ------------------------------------------------------
# Enable crontab
# ------------------------------------------------------
sudo systemctl enable --now cronie.service

cat << "EOF"

██  ███ █   █ ███
█ █ █ █ ██  █ █
█ █ █ █ █ █ █ ███
█ █ █ █ █  ██ █
██  ███ █   █ ███

EOF

