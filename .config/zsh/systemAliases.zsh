#!/bin/zsh

# ##############################################
# ############## SYSTEM ALIASES ################
# ##############################################

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
# System Control
# cronie.service 
alias enable.cronie="sudo systemctl enable --now cronie.service"
alias stop.cronie="sudo systemctl stop cronie.service"
alias disable.cronie="sudo systemctl disable --now cronie.service"
alias status.cronie="sudo systemctl status cronie.service"
# set crontab
alias setcron="sudo cp -r /Backup/cron/* /var/spool/cron/"
alias vide="neovide"
alias v="nvim"
alias mount.all="sudo mount -a"
# search for files requires ripgrep, fzf and fd packages
alias f="fd --hidden --exclude .git | fzf-tmux -p | xargs nvim"
# alias z="zoxide"
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

# PYTHON-------------------------------------------------------------
alias py="python"
# Run python app
alias pyapp="python app.py"
# Run flask app with port 8000
alias flaskrun="flask run --port=8000"
# Global myenv
alias myenv.g="source /home/$USER/Workspace/Python/venv/bin/activate"
# Activate Project myenv in current directory
alias myenv="source ./myenv/bin/activate"
# Deactivate myenv
alias myenv.d="deactivate"
# Create and source new myenv in current location
alias myenv.c="python -m venv myenv ; source ./myenv/bin/activate"
# Python version
alias pv="py --version"

# Pip3 List
alias pip.list="pip3 list"
alias pipug="pip3 install --upgrade"

# Switch Python Version
alias zxpython="sudo update-alternatives --config python3"

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
alias zxacf="vim ~/Dotfiles/auto-cpufreq/etc/auto-cpufreq.conf"
# Update Grub
alias update.grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

# TimeShift configuration settings
alias zxtimeshift="sudo nvim /etc/timeshift-autosnap.conf"

# System error
alias s.journalctl="sudo journalctl -p 3 -xb"

# Failed processes
alias s.process="sudo systemctl --failed"

# Bpytop
alias s.bpytop="bpytop"

# Log out
alias logout="loginctl terminate-user $USER"

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
alias s.systemctl="systemctl list-unit-files --type=service"

# Btop settings
# alias btop="btop --utf-force"

# System Control Settings
alias s.systemctl="systemctl list-unit-files --type=service"

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
alias systemctl.reload="sudo systemctl daemon-reload"

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
alias acf.daemon.start="sudo auto-cpufreq --install"
alias acf.daemon.stop="sudo auto-cpufreq --remove"

alias zxoptimus="nvim /usr/share/optimus-manager.conf"



# ##############################################
# ############## NEW ALIASES    ################
# ##############################################

alias j='z'
alias zz='zi'
alias zsh.update.plugins="find "$ZDOTDIR/plugins" -type d -exec test -e '{}/.git' ';' -print0 | xargs -I {} -0 git -C {} pull -q"

# get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

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
