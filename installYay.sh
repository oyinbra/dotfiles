cd ~/Repos
sudo pacman -Sy --needed git base-devel
mkdir ~/Tmp
cd ~/Tmp
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
