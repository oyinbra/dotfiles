#/bin/bash

# ----------------------------------------------------- 
# Install Script for my packages
# ------------------------------------------------------

# ------------------------------------------------------
# Load Library
# ------------------------------------------------------
source $(dirname "$0")/scripts/library.sh
clear
echo "  ___           _        _ _  "
echo " |_ _|_ __  ___| |_ __ _| | | "
echo "  | ||  _ \/ __| __/ _  | | | "
echo "  | || | | \__ \ || (_| | | | "
echo " |___|_| |_|___/\__\__,_|_|_| "
echo "                              "
echo "-------------------------------------"
echo ""

# ------------------------------------------------------
# Check if yay is installed
# ------------------------------------------------------
if sudo pacman -Qs yay > /dev/null ; then
    echo "yay is installed. You can proceed with the installation"
else
    echo "yay is not installed. Will be installed now!"
    _installPackagesPacman "base-devel"
    git clone https://aur.archlinux.org/yay-git.git ~/yay-git
    cd ~/yay-git
    makepkg -si
    cd ~/Dotfiles/
    clear
    echo "yay has been installed successfully."
    echo ""
    echo "  ___           _        _ _  "
    echo " |_ _|_ __  ___| |_ __ _| | | "
    echo "  | ||  _ \/ __| __/ _  | | | "
    echo "  | || | | \__ \ || (_| | | | "
    echo " |___|_| |_|___/\__\__,_|_|_| "
    echo "                              "
    echo "-------------------------------------"
    echo ""
fi

# ------------------------------------------------------
# Check if paru is installed
# ------------------------------------------------------
if sudo pacman -Qs paru > /dev/null ; then
    echo "paru is installed. You can proceed with the installation"
else
    echo "paru is not installed. Will be installed now!"
    _installPackagesPacman "base-devel"
    git clone https://aur.archlinux.org/paru-bin.git ~/paru-bin
    cd ~/paru-bin
    makepkg -si
    cd ~/Dotfiles/
    clear
    echo "paru has been installed successfully."
    echo ""
    echo "  ___           _        _ _  "
    echo " |_ _|_ __  ___| |_ __ _| | | "
    echo "  | ||  _ \/ __| __/ _  | | | "
    echo "  | || | | \__ \ || (_| | | | "
    echo " |___|_| |_|___/\__\__,_|_|_| "
    echo "                              "
    echo "-------------------------------------"
    echo ""
fi

# ------------------------------------------------------
# Confirm Start
# ------------------------------------------------------

while true; do
    read -p "DO YOU WANT TO START THE INSTALLATION NOW? (Yy/Nn): " yn
    case $yn in
        [Yy]* )
            echo "Installation started."
        break;;
        [Nn]* ) 
            exit;
        break;;
        * ) echo "Please answer yes or no.";;
    esac
done

# ------------------------------------------------------
# Install required packages
# ------------------------------------------------------
echo ""
echo "-> Install main packages"

packagesPacman=(
    "git"
    "webapp-manager"
    "expac"
    "dbeaver"
    "mysql-workbench"
    "marktext"
    "haruna"
    "electron"
    "nvidia"
    "nvidia-utils"
    "nvidia-settings"
    "noto-fonts-emoji"
    "yarn"
    "sass"
    "zsh"
    "spotify"
    "kdeplasma-addons"
    "grub-btrfs"
    "microsoft-edge-dev-bin"
    "slack-desktop"
    "zoom"
    "btrfs-progs"
    "cryptsetup"
    "anaconda"
    "intellij-idea-community-edition"
    "auto-cpufreq"
    "wl-clipboard"
    "whatsapp-for-linux"
    "plasma-wayland-protocols"
    "npm"
    "spectacle"
    "caffeine-ng"
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
    "brave-bin"
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
    "onlyoffice-bin"
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
systemctl enable --now preload.service
