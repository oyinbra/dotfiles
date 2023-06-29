sudo pacman -Sy --needed base-devel
mkdir ~/tmp
cd ~/tmp
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
