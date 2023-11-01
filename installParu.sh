sudo pacman -Sy --needed base-devel
mkdir ~/Tmp
cd ~/Tmp
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
