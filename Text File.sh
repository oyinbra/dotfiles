
sudo pacman -S git stow zsh neofetch

cd

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

git clone https://github.com/Oyinbra/.dotfiles.git

cd .dotfiles

stow fonts icons oh-my-zsh neofetch-arch powerlevel10k themes zsh-aliases zshrc

cd

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

rm -rf .zshrc
# rm -rf .zsh_history

cd .dotfiles

stow zshrc .zsh_history
