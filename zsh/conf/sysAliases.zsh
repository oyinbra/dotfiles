#!/bin/zsh

# ███████╗██╗   ██╗███████╗     █████╗ ██╗     ██╗ █████╗ ███████╗███████╗███████╗
# ██╔════╝╚██╗ ██╔╝██╔════╝    ██╔══██╗██║     ██║██╔══██╗██╔════╝██╔════╝██╔════╝
# ███████╗ ╚████╔╝ ███████╗    ███████║██║     ██║███████║███████╗█████╗  ███████╗
# ╚════██║  ╚██╔╝  ╚════██║    ██╔══██║██║     ██║██╔══██║╚════██║██╔══╝  ╚════██║
# ███████║   ██║   ███████║    ██║  ██║███████╗██║██║  ██║███████║███████╗███████║
# ╚══════╝   ╚═╝   ╚══════╝    ╚═╝  ╚═╝╚══════╝╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝

# Show figlet fonts
alias figfonts="showfigfonts"
# Reconfigure kwin
alias kwin="qdbus org.kde.KWin /KWin reconfigure"
# List Kwin Meta shortcutNames
alias kwinlist="qdbus org.kde.kglobalaccel /component/kwin org.kde.kglobalaccel.Component.shortcutNames"
# Change META key in kwin
alias kwinkrunner='kwriteconfig5 --file ~/.config/kwinrc --group ModifierOnlyShortcuts --key Meta "org.kde.krunner,/App,,toggleDisplay" && kwin'
alias kwinexposeall='kwriteconfig5 --file ~/.config/kwinrc --group ModifierOnlyShortcuts --key Meta "org.kde.kglobalaccel,/component/kwin,org.kde.kglobalaccel.Component,invokeShortcut,ExposeAll" && kwin'
# Windows overview
alias kwinoverview='kwriteconfig5 --file ~/.config/kwinrc --group ModifierOnlyShortcuts --key Meta "org.kde.kglobalaccel,/component/kwin,org.kde.kglobalaccel.Component,invokeShortcut,Overview" && kwin'
# Check swapp value 
alias swappiness="bat /proc/sys/vm/swappiness"
# jupyter notebook
alias jn="jupyter notebook"

# check update-notifier
alias pacau="update-notifier"
alias h='history'
alias hs='history | grep'
alias hsi='history | grep -i'

# Nvidia settings
alias s.graphics='glxinfo | grep "OpenGL renderer"'
alias nvidia="optimus-manager --switch nvidia --no-confirm"
alias intel="optimus-manager --switch integrated --no-confirm"
alias hybrid="optimus-manager --switch hybrid --no-confirm"
# Magic link
alias magic.slack="while sleep .1; do ps aux | grep slack | grep -v grep | grep magic; done"
alias magic.discord="while sleep .1; do ps aux | grep discord | grep -v grep | grep magic; done"
# set crontab
alias setcron="sudo cp -r /Backup/cron/* /var/spool/cron/"
alias vide="neovide"
alias v="nvim"
alias mount.all="sudo mount -a"
# search for files requires ripgrep, fzf and fd packages
alias f="fd --hidden --exclude .git | fzf-tmux -p | xargs nvim"
alias t="tree"
alias q="exit"
# Copy
alias cp="cp -r"
# Timeshift
alias tsb="sudo timeshift --create --comments"
alias tsr="sudo timeshift --restore"

# Watch SASS and output to dist folder
alias sass.watch="sass --watch scss:dist/css"

alias cl="clear"
alias mkdir="mkdir -p"
# List Color
alias ls="ls --color=auto"
# List All
alias la="ls -a"

# Terminal config
alias zxterminal="sudo update-alternatives --config x-terminal-emulator"

# Delete Directory or files
alias rmr="rm -r"
alias rm="rm -rf"
alias cp="cp -r"
# List Users
alias list.users="cat /etc/passwd"

# Hibernate
alias hibernate="systemctl hibernate"

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Suspend
alias suspend="systemctl suspend"

# Nethogs
alias netlog="sudo nethogs"

# Symlink
alias sym="ln -sf"

# Grub file
alias zxgrub="sudo nvim /etc/default/grub"
alias zxacf="nvim ~/Dotfiles/etc/auto-cpufreq.conf"
# Update Grub
alias update.grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

# TimeShift configuration settings
alias zxtimeshift="sudo nvim /etc/timeshift-autosnap.conf"

# System error
alias s.journalctl="sudo journalctl -p 3 -xb"

# Failed processes
alias sysmprocess="sudo systemctl --failed"

# Bpytop
alias s.bpytop="bpytop"

# Log out
alias logout="qdbus org.kde.ksmserver /KSMServer logout 0 0 0"

 # List npm package owners
alias npm.owner="ls -la $(npm root -g)"
 # List npm packages
alias npm.installed="npm list -g --depth=0"
# Change npm package ownership
alias npm.chown="sudo chown -R $USER $(npm root -g)"

# check swappiness
alias swap="bat /proc/sys/vm/swappiness"

# Process ID
alias pid="ps -ef|grep -i"

# Systemctl Services
alias sysmservices="systemctl list-unit-files --type=service"

# Btop settings
# alias btop="btop --utf-force"

# System Control Settings
alias sysmctl="systemctl list-unit-files --type=service"

# Nano config
alias n="sudo nano"

# NVIM Config
alias vim="sudo nvim"

# Alacritty config
alias zxalacritty="nvim ~/.config/alacritty/alacritty.yml"
alias zzalacritty="~/.config/alacritty/"

# Post arch install
alias zxpost.arch="nvim /home/$USER/Dotfiles/post-arch.sh"

# Reload systemctl daemo
alias sysmreload="sudo systemctl daemon-reload"

# Listen to opened port
alias listen.port="sudo lsof -i -P -n | grep LISTEN"

# Find process
alias lsp="ps aux | grep"
alias root="sudo -s"

# Update clamav antivirus
alias freshclam="sudo freshclam"

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
alias config="~/.config"
alias nvimd="~/.config/nvim"
alias zshd="~/.config/zsh/conf/"

#Dotfiles
alias dotfiles="~/Dotfiles"

# Work Directory
alias workspace="cd ~/Workspace"
alias pythond="cd ~/Workspace/python"
alias opensource="cd ~/Workspace/OpenSourceContribution/"

alias kittyd="~/.config/kitty/"
# Project Directory
alias projects="cd ~/Workspace/Projects"

# PKG Packages
alias pkg="/var/cache/pacman/pkg"

# Pictures Folder
alias pictures="~/Pictures"

# Local user Backup
alias backup="sudo /home/oyinbra/Dotfiles/backup.sh"
alias backup.pkg="sudo rsync -aAXv --delete /var/cache/pacman/pkg /Backup"
# Local user Restore  
alias restore="sudo /home/oyinbra/Dotfiles/restore.sh"      

# Search for files or folders including hidden folders and files
alias list="ls -a | grep -i"

# Refresh zsh
alias reload="source ~/.zshrc"

# Zsh config
alias zxzshrc="nvim ~/.zshrc"

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

if [[ $TERM == "xterm-kitty" ]]; then
  alias ssh="kitty +kitten ssh"
fi

case "$(uname -s)" in

Darwin)
	# echo 'Mac OS X'
	alias ls='ls -G'
	;;

Linux)
	alias ls='ls --color=auto'
	;;

CYGWIN* | MINGW32* | MSYS* | MINGW*)
	# echo 'MS Windows'
	;;
*)
	# echo 'Other OS'
	;;
esac
