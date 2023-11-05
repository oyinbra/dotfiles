#!/bin/bash

# Update grub themes
if [ ! -d "$HOME/Tmp/grub2-themes/" ]; then
  git clone "https://github.com/vinceliuice/grub2-themes.git" "$HOME/Tmp/grub2-themes/"
fi
cd ""
sudo $HOME/Tmp/grub2-themes/install.sh -b -t tela