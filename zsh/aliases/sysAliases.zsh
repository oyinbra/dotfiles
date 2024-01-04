#!/bin/zsh

# ███ █ █ ███   ███ █   ███ ███ ███ ███ ███
# █   █ █ █     █ █ █    █  █ █ █   █   █
#  █   █   █    █ █ █    █  █ █  █  ███  █
#   █  █    █   ███ █    █  ███   █ █     █
# ███  █  ███   █ █ ███ ███ █ █ ███ ███ ███

alias torrent="aria2c"
# Show figlet fonts
alias figfonts="showfigfonts"
# Reconfigure kwin
alias metareload="qdbus org.kde.KWin /KWin reconfigure"
# List Kwin Meta shortcutNames
alias metalist="qdbus org.kde.kglobalaccel /component/kwin org.kde.kglobalaccel.Component.shortcutNames"
# Change META key in kwin
alias metakrunner='kwriteconfig5 --file ~/.config/kwinrc --group ModifierOnlyShortcuts --key Meta "org.kde.krunner,/App,,toggleDisplay" && metareload'
alias metalauncher='kwriteconfig5 --file ~/.config/kwinrc --group ModifierOnlyShortcuts --key Meta "org.kde.plasmashell,/PlasmaShell,org.kde.PlasmaShell,activateLauncherMenu" && metareload'
alias metaexposeall='kwriteconfig5 --file ~/.config/kwinrc --group ModifierOnlyShortcuts --key Meta "org.kde.kglobalaccel,/component/kwin,org.kde.kglobalaccel.Component,invokeShortcut,ExposeAll" && metareload'
# Windows overview
alias metaoverview='kwriteconfig5 --file ~/.config/kwinrc --group ModifierOnlyShortcuts --key Meta "org.kde.kglobalaccel,/component/kwin,org.kde.kglobalaccel.Component,invokeShortcut,Overview" && metareload'
# Check swapp value 
alias swappiness="bat /proc/sys/vm/swappiness"
alias swappiness.10='echo "vm.swappiness=10" | sudo tee --append "/etc/sysctl.conf"'
# Magic link
alias magic.slack="while sleep .1; do ps aux | grep slack | grep -v grep | grep magic; done"
alias magic.discord="while sleep .1; do ps aux | grep discord | grep -v grep | grep magic; done"
# set crontab
alias setcron="sudo cp -r /Backup/cron/* /var/spool/cron/"
alias vide="neovide"
alias v="nvim"
# search for files requires ripgrep, fzf and fd packages
alias f="fd --hidden --exclude .git | fzf-tmux -p | xargs nvim"
alias q="exit"
# Timeshift
alias tsb="sudo timeshift --create --comments"
alias tsr="sudo timeshift --restore"
# Watch SASS and output to dist folder
alias sass.watch="sass --watch scss:dist/css"
alias mkdir="mkdir -p"
# List All
alias ls='eza -h   --icons=auto' # Grid
alias la='eza -a --icons=auto --sort=name --group-directories-first' # long list all
alias l='eza -1   --icons=auto' # List
alias ll='eza -lh  --icons=auto' # long list
alias lv='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias rm="rm -rf" # Delete Directory or files
alias cp="cp -r"
alias hibernate="systemctl hibernate"
alias suspend="systemctl suspend"
# Failed processes
alias ctlprocess="sudo systemctl --failed"
# Systemctl Services
alias ctlservices="systemctl list-unit-files --type=service"
# System Control Settings
alias ctllist="systemctl list-unit-files --type=service"
# Reload systemctl daemo
alias ctlreload="sudo systemctl daemon-reload"
alias ctlenable="sudo systemctl enable"
alias ctlstart="sudo systemctl start"
alias ctlrestart="sudo systemctl restart"
alias ctlstatus="sudo systemctl status"
# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
# Nethogs
alias netlog="sudo nethogs"
# Grub file
alias zxgrub="sudo nvim /etc/default/grub"
alias zxacf="nvim ~/Dotfiles/etc/auto-cpufreq.conf"
# Update Grub
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
# System error
alias s.journalctl="sudo journalctl -p 3 -xb"
# Log out
alias logout="qdbus org.kde.ksmserver /KSMServer logout 0 0 0"
 # List npm package owners
alias npm.owner="ls -la $(npm root -g)"
 # List npm packages
alias npm.installed="npm list -g --depth=0"
# Change npm package ownership
alias npm.chown="sudo chown -R $USER $(npm root -g)"
# Process ID
alias pid="ps -ef|grep -i"
# NVIM Config
alias vim="sudo nvim"
# Alacritty config
alias zxalacritty="nvim ~/.config/alacritty/alacritty.yml"
alias alacrittyd="~/.config/alacritty/"
# Listen to opened port
alias listen.port="sudo lsof -i -P -n | grep LISTEN"
# Find process
alias lsp="ps aux | grep"
alias root="sudo su"

# -------------------------------------------
# AUTO-CPUFREQ
# -------------------------------------------
alias acf="sudo auto-cpufreq --stats"
alias acfstart="sudo auto-cpufreq --install"
alias acfstop="sudo auto-cpufreq --remove"
alias zxoptimus="nvim /usr/share/optimus-manager.conf"

# -------------------------------------------
# DIRECTORY ALIASES
# -------------------------------------------
alias config=" cd ~/.config"
alias nvimd="cd ~/.config/nvim"
alias zshd="cd ~/.config/zsh/conf/"
alias dotfiles="cd ~/Dotfiles"
alias workspace="cd ~/Workspace"
alias pythond="cd ~/Workspace/python"
alias opensource="cd ~/Workspace/OpenSourceContribution/"
alias kittyd="cd ~/.config/kitty/"
alias projects="cd ~/Workspace/Projects"
alias pkgd="cd /var/cache/pacman/pkg"
alias pictures="cd ~/Pictures"
# Local user Backup
alias backup="sudo /home/oyinbra/Dotfiles/backup.sh"
# Search for files or folders including hidden folders and files
alias lsp="ls -a | grep -i"
alias ezsh="exec zsh"
alias zxkitty="nvim ~/.config/kitty/kitty.conf"
alias zz='zi'
# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
# easier to read disk
alias df='df -h'     # human-readable sizes
alias fs="du -sh" # Check Folder size
alias free='free -m' # show sizes in MB

