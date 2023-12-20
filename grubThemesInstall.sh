#!/bin/bash

cat << "EOF"

███ ███ █ █ ██    ███ █ █ ███ █   █ ███ ███
█   █ █ █ █ █ █    █  █ █ █   ██ ██ █   █
█   ██  █ █ ██     █  ███ ███ █ █ █ ███  █
█ █ █ █ █ █ █ █    █  █ █ █   █   █ █     █
███ █ █ ███ ██     █  █ █ ███ █   █ ███ ███

EOF

# ------------------------------------------------------
# Check and create ~/Tmp directory
# ------------------------------------------------------
TMP_DIR="$HOME/Tmp"
if [ ! -d "$TMP_DIR" ]; then
  mkdir "$TMP_DIR"
fi

# ------------------------------------------------------
# Change Directory to grub2-themest if exists
# Update the old version if available
# ------------------------------------------------------
if [ -d "$TMP_DIR/grub2-themes/" ]; then
  cd "$TMP_DIR/grub2-themes"
  git pull origin master  # Update the existing version
else
  # ------------------------------------------------------
  # Clone the grub2-themes repo
  # ------------------------------------------------------
  git clone "https://github.com/vinceliuice/grub2-themes.git" "$TMP_DIR/grub-themes"
  cd "$TMP_DIR/grub-themes"
fi

# ------------------------------------------------------
# Update grub themes
# ------------------------------------------------------
if [ ! -d "$TMP_DIR/grub2-themes/" ]; then
  git clone "https://github.com/vinceliuice/grub2-themes.git" "$TMP_DIR/grub2-themes/"
fi
cd "$TMP_DIR/grub2-themes/"

# ------------------------------------------------------
# Install grub themes
# ------------------------------------------------------
sudo ./install.sh -b -t tela

