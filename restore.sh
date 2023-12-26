#!/bin/bash

cat << "EOF"

███ ███ ███ ███ ███ ███   ███ █ █ ███ ███ ███ █   █
█ █ █    █  █ █ █ █ █     █   █ █ █    █  █   ██ ██
██  ███  █  █ █ ██  ███    █   █   █   █  ███ █ █ █
█ █ █    █  █ █ █ █ █       █  █    █  █  █   █   █
█ █ ███  █  ███ █ █ ███   ███  █  ███  █  ███ █   █

EOF

# ---------------------------------------------------------
# Load function library from modules directory in Dotfiles
# ---------------------------------------------------------
source $(dirname "$0")/modules/library.sh
clear

confirm_execution ./sysDirectories.sh
confirm_execution ./arcolinuxRepos.sh
confirm_execution ./paruInstall.sh
confirm_execution ./yayInstall.sh
confirm_execution ./myPackages.sh
confirm_execution ./encryptedBackupPartition.sh
confirm_execution ./homeRestore.sh
confirm_execution ./symlinks.sh

cat << "EOF"
▄▖▄▖▄▖▄▖▄▖▄▖  ▄▖▄▖▖▖  ▄▖▄▖▖ ▖▄▖▄▖▄▖
▙▘▙▖▐ ▌▌▙▘▙▖  ▗▘▚ ▙▌  ▌ ▌▌▛▖▌▙▖▐ ▌
▌▌▙▖▐ ▙▌▌▌▙▖  ▙▖▄▌▌▌  ▙▖▙▌▌▝▌▌ ▟▖▙▌

EOF
confirm_execution ./zshConfig.sh

