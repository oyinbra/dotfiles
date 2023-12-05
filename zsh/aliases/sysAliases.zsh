#!/bin/zsh

# ███ █ █ ███   ███ █   ███ ███ ███ ███ ███
# █   █ █ █     █ █ █    █  █ █ █   █   █
#  █   █   █    █ █ █    █  █ █  █  ███  █
#   █  █    █   ███ █    █  ███   █ █     █
# ███  █  ███   █ █ ███ ███ █ █ ███ ███ ███

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
alias l='eza -h   --icons=auto' # Grid
alias la='eza -a --icons=auto --sort=name --group-directories-first' # long list all
alias ls='eza -1   --icons=auto' # List
alias ll='eza -lh  --icons=auto' # long list
alias lv='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs

alias rm="rm -rf" # Delete Directory or files
alias cp="cp -r"

# Hibernate
alias hibernate="systemctl hibernate"
# Suspend
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
alias zzalacritty="~/.config/alacritty/"

# Listen to opened port
alias listen.port="sudo lsof -i -P -n | grep LISTEN"

# Find process
alias lsp="ps aux | grep"
alias root="sudo -s"

# ##############################################
# ############## AUTO-CPUFREQ ##################
# ##############################################

alias acf="sudo auto-cpufreq --stats"
# alias acf-monitor="sudo auto-cpufreq --monitor"
# alias acf-live="sudo auto-cpufreq --live"
alias acfstart="sudo auto-cpufreq --install"
alias acfstop="sudo auto-cpufreq --remove"

alias zxoptimus="nvim /usr/share/optimus-manager.conf"

# ##############################################
# ############## DIRECTORY ALIASES #############
# ##############################################

# .config
alias config=" cd ~/.config"
alias nvimd="cd ~/.config/nvim"
alias zshd="cd ~/.config/zsh/conf/"

#Dotfiles
alias dotfiles="cd ~/Dotfiles"

# Work Directory
alias workspace="cd ~/Workspace"
alias pythond="cd ~/Workspace/python"
alias opensource="cd ~/Workspace/OpenSourceContribution/"

alias kittyd="cd ~/.config/kitty/"
# Project Directory
alias projects="cd ~/Workspace/Projects"

# PKG Packages
alias pkgd="cd /var/cache/pacman/pkg"

# Pictures Folder
alias pictures="cd ~/Pictures"

# Local user Backup
alias backup="sudo /home/oyinbra/Dotfiles/backup.sh"
alias backup.pkg="sudo rsync -aAXv --delete /var/cache/pacman/pkg /Backup"
# Local user Restore  
alias restore="sudo /home/oyinbra/Dotfiles/restore.sh"      

# Search for files or folders including hidden folders and files
alias lsp="ls -a | grep -i"

# Zsh config
alias zxzshrc="nvim ~/.zshrc"
alias ezsh="exec zsh"

# Bash config
alias zxbash="nvim ~/.bashrc"

# Neofetch Distro
alias zxneofetch="nvim ~/.config/neofetch/config.conf"

# Zsh aliases config
alias zxalias="nvim ~/.config/zsh/aliases.zsh"
alias zxkitty="nvim ~/.config/kitty/kitty.conf"

# Coinmarketcapital
alias cmc="python -u /home/$USER/Workspace/python/cmc.py"

# Check Folder size
alias fs="du -sh"

# User Share Themes
alias zzthemes="/usr/share/themes"

# User Share Icons
alias zzicons="/usr/share/icons"

# User Share Fonts
alias zzfonts="/usr/share/fonts"

# Hostname config
alias zzhostname="sudo nano /etc/hostname"

# Git folder
alias zztmp="~/Tmp"

# ##############################################
# ############## NEW ALIASES    ################
# ##############################################

alias j='z'
alias zz='zi'
alias zsh.update.plugins="find "$ZDOTDIR/plugins" -type d -exec test -e '{}/.git' ';' -print0 | xargs -I {} -0 git -C {} pull -q"

# Remarkable
alias restream='restream -p'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# easier to read disk
alias df='df -h'     # human-readable sizes
alias free='free -m' # show sizes in MB

# get top process eating memory
alias psmem='ps auxf | sort -nr -k 4 | head -5'

# get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3 | head -5'

# gpg encryption
# verify signature for isos
alias gpg.check="gpg2 --keyserver-options auto-key-retrieve --verify"
# receive the key of a developer
alias gpg.retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"

# For when keys break
alias archlinux.fix.keys="sudo pacman-key --init && sudo pacman-key --populate archlinux && sudo pacman-key --refresh-keys"

