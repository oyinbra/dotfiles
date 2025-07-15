#!/bin/bash
set -e

# -------------------------------------
# Confirm start
# -------------------------------------
while true; do
    read -p "DO YOU WANT TO PROCEED (Yy/Nn): " yn
    yn=${yn,,}
    case $yn in
        y ) echo "Started."; break ;;
        n ) echo "Aborted."; exit 1 ;;
        * ) echo "Please answer yes or no." ;;
    esac
done

# -------------------------------------
# Check yay is installed
# -------------------------------------
if ! command -v yay &>/dev/null; then
    echo "Error: 'yay' is not installed. Please install it first." >&2
    exit 1
fi

# -------------------------------------
# Filter only valid packages
# -------------------------------------
_filterValidPackages() {
    local valid=()
    for pkg in "$@"; do
        [[ -z "$pkg" ]] && continue
        if pacman -Si "$pkg" &>/dev/null || yay -Si "$pkg" &>/dev/null; then
            valid+=("$pkg")
        else
            echo "$pkg" >> skipped-packages.txt
            echo "⚠️  Skipping invalid or not-found package: $pkg" >&2
        fi
    done
    echo "${valid[@]}"
}

# -------------------------------------
# Install pacman packages
# -------------------------------------
_installPackagesPacman() {
    local toInstall=()
    for pkg in "$@"; do
        if pacman -Qi "$pkg" &>/dev/null; then
            echo "$pkg is already installed."
        else
            toInstall+=("$pkg")
        fi
    done

    if [ ${#toInstall[@]} -gt 0 ]; then
        echo "Installing missing pacman packages:"
        printf '%s\n' "${toInstall[@]}"
        sudo pacman -S --noconfirm "${toInstall[@]}"
    else
        echo "All pacman packages already installed."
    fi
}

# -------------------------------------
# Install AUR packages
# -------------------------------------
_installPackagesYay() {
    local toInstall=()
    for pkg in "$@"; do
        if pacman -Qi "$pkg" &>/dev/null; then
            echo "$pkg is already installed."
        else
            toInstall+=("$pkg")
        fi
    done

    if [ ${#toInstall[@]} -gt 0 ]; then
        echo "Installing missing AUR packages:"
        printf '%s\n' "${toInstall[@]}"
        yay -S --noconfirm "${toInstall[@]}"
    else
        echo "All AUR packages already installed."
    fi
}

# -------------------------------------
# Pacman packages
# -------------------------------------
readarray -t packagesPacman < <(grep -v '^\s*#' <<'EOF'
# --- Bluetooth ---
# bluez
# bluez-utils

# --- Networking ---
networkmanager
dhcp
avahi
nethogs
firewalld

# --- KDE/Plasma extras ---
# plasma-meta
qt5-quickcontrols
qt5-quickcontrols2
qt5-graphicaleffects
kwalletmanager
kwallet-pam
spectacle
plasma-wayland-protocols
kdeconnect

# --- Fonts ---
# adobe-source-sans-pro-fonts  # ❌ not found
aspell-en
enchant
ttf-anonymous-pro
ttf-bitstream-vera
ttf-dejavu
ttf-droid
ttf-liberation
ttf-ubuntu-font-family

# --- Firmware and microcode ---
sof-firmware
intel-ucode

# --- Power management ---
acpi
acpi_call
upower

# --- Dev tools and utilities ---
git
neofetch-git
man-db
man-pages
bash-completion
dialog
bat
btop
duf
lazygit
rate-mirrors
xclip
tree
vifm
wl-clipboard
neovim
pynvim
ripgrep
fd
zoxide
sxhkd
electron
yarn
# sass                         # ❌ not found
appimagelauncher
neovim-symlinks
expac
python-pyqt5

# --- Filesystem tools ---
btrfs-progs
mtools
dosfstools
os-prober
grub-btrfs
gparted

# --- Security ---
seahorse
cryptsetup

# --- Display manager ---
sddm

# --- GUI apps and browsers ---
firefox
deluge
deluge-gtk
obsidian
freedownloadmanager
haruna
gthumb
webapp-manager
rofi-emoji
rofi-calc
deja-dup

# --- Language + PDF tools ---
languagetool
libmythes
mythes-en
gst-libav
gst-plugins-good
icedtea-web

# --- Misc UX ---
nano-syntax-highlighting
imath
clutter
webkit2gtk

# --- System enhancement ---
eos-update-notifier
EOF
)

# -------------------------------------
# AUR packages
# -------------------------------------
readarray -t packagesYay < <(grep -v '^\s*#' <<'EOF'
# --- AUR / binaries ---
visual-studio-code-bin
# pgadmin4                     # ❌ not found or broken in AUR
brave-bin
# brave-beta-bin
# brave-nightly-bin
microsoft-edge-stable-bin
# microsoft-edge-beta-bin
# microsoft-edge-dev-bin
espanso-wayland
espanso-gui
EOF
)

# -------------------------------------
# Filter and install
# -------------------------------------
rm -f skipped-packages.txt

validPacman=($(_filterValidPackages "${packagesPacman[@]}"))
validYay=($(_filterValidPackages "${packagesYay[@]}"))

_installPackagesPacman "${validPacman[@]}"
_installPackagesYay "${validYay[@]}"

echo "✅ Install complete."
if [[ -f skipped-packages.txt ]]; then
    echo "⚠️  Skipped packages logged in: skipped-packages.txt"
fi

sudo firewall-cmd --zone=public --add-port=1714-1764/tcp --permanent
sudo firewall-cmd --zone=public --add-port=1714-1764/udp --permanent
sudo firewall-cmd --reload

