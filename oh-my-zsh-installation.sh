echo "#############################################################################"
echo "#############################################################################"
echo "##                                                                         ##"
echo "##                         OH-MY-ZSH INSTALLATION                          ##"
echo "##                                                                         ##"
echo "#############################################################################"
echo "#############################################################################" 


sudo pacman -Sy zsh git wget neofetch

cd
git clone https://github.com/Oyinbra/.dotfiles.git

sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"