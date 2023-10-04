#!/bin/sh
# ##############################################
# ################# GIT ########################
# ##############################################

# Lazy Git
alias lg="lazygit"

# Check Git current version
alias gv="git --version"

# To edit your global Git configuration
alias gcedit="git config --global --edit"

# To initialize a new Git repository in your current directory
alias gi="git init"

# Add files to staging
alias ga="git add"

# Add and commit all changes with a message
alias gacm="git add --all && git commit -m"

# To add all changes, including modified, new, and deleted files
alias gaa="git add --all"

# To make a Git commit with a commit message
alias gcmsg="git commit -m"

# Add a remote GitHub Repository Link
git config --global alias.rao '!f() { \
  read -p "Enter the repository URL for '\''origin'\'': " origin_url && \
  git remote add origin "$origin_url"; \
}; f'
# alias grao="git rao"
alias grao="git rao"

# push to the current branch
alias gp="git push"

# force push to the current branch
alias gpf="git push -f"

# Check the status of your current Git repository
alias gst="git status"

# Check your list of branch
alias gb="git branch"

# Rename the current branch
alias gbr="git branch -m"

# Git checkout
alias gco="git checkout"

# Create and switch to the new branch
alias gcb="git checkout -b"

# fetch the new data from the remote repo without merging them
alias gf="git fetch"

# Merge the current branch with the remote branch
alias gm="git merge"

# Update your local Git repository with changes from the remote repository
alias glp="git pull"

# replace the entire history of one branch with another. 
alias grb="git rebase"

# Create a new commit to undo changes of last commit without deleting history
alias grvh="git revert HEAD"

# Create a new commit to undo changes of last commit and deleting it from history
alias grh-1="git reset HEAD~1"

# Reset local branch to origin main branch
alias grm="git reset --hard origin/main"

# Create a new commit to undo changes of last commit and delete unstaged changes
alias grshh="git reset --hard HEAD~1"

# Check the remote link
alias gl="git remote -v"

# Git log
alias glg="git log"

# remove files that have been staged
alias gun="git rm --cached"

# set the Git configuration option for enabling fast-forward merges
alias gf="git config --global pull.ff true"

# Set git credential
alias gitconfig="f() { \
  git config --global credential.helper cache && \
  read -p 'Enter your username: ' username && \
  read -p 'Enter your email address: ' email && \
  git config --global user.name \"$username\" && \
  git config --global user.email \"$email\"; \
}; f"


# ##############################################
# ############## ACTION ALIASES ################
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
alias myenv="source /home/$USER/Myenv/bin/activate"
alias dmyenv="deactivate"

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
# ################### PACMAN ###################
# ##############################################

# UPDATE and INSTALL PACKAGES
alias pacsync="sudo pacman -Syy"

# refresh pacman database
alias pacfresh="sudo pacman -Fy"
# update packages
alias ud="sudo pacman -Sy --noconfirm"
# upgrade packages
alias ug="sudo pacman -Syu --noconfirm"
alias pacins="sudo pacman -S"
alias upgrade="pacfresh ; pacsync ; paru"
# search for packages in database
alias pacsearch="sudo pacman -Ss"

# to search for already installed packages
alias pacqs="pacman -Qs"

alias pacinsnc="sudo pacman -S --noconfirm"
alias pacrem="sudo pacman -R"
alias pacfile="sudo pacman -S --needed - <"
# Downgrade Packages
alias pacdgrade="sudo pacman -Suu"

# Install pkg files
alias pacpkg="sudo pacman -U"

# Clean uninstalled packages from cache
alias pacclean="sudo pacman -Sc"

# Clean alien packages
alias pacalien="sudo pacman -c"

# Clean all packages from cache
alias paccache="sudo pacman -Scc"

# List packages in pkg cache file
alias paclistpkg="l /var/cache/pacman/pkg | less"

# List orphan packages
alias paclistorphan="sudo pacman -Qtdq"

# List and Remove orphan packages
alias pacremorphan="sudo pacman -R $(pacman -Qtdq)"

# Pactree
alias pactree.r="pactree -r"

# Completely clean packages
alias pacrs="sudo pacman -Rs"

# Completely remove packages
alias pacrns="sudo pacman -Rns"

# Find packages to install
alias pacfind="pacman -F"

# Pacman is currently in use, please wait...
alias pacunlock="sudo rm -rf /var/lib/pacman/db.lck"

# Update Pacman Mirrors for Manjaro
alias pacmanjaro="sudo pacman-mirrors --fasttrack"

# List the last installed packeages
alias paclast='if [ -f /var/log/pacman.log ]; then expac --timefmt="%Y-%m-%d %T" "%l|%-30n|%-15d" $(zcat /var/log/pacman.log* 2>/dev/null | awk "/^\[.*\] installed/ {print \$1}") | sort | tail -n 100; else echo "Pacman log file not found or not in gzip format"; fi'

# ##############################################
# ################### PARU ######################
# ##############################################

# UPDATE and INSTALL PACKAGES
# Turn paru into yay
alias yay="paru"
alias aurupdate="paru -Syyu"
alias paru.ud="paru -Sy"
alias paru.ug="paru -Syu"
alias paru.s="paru -S"
alias paru.r="paru -R"
alias paru.c="paru -c"
alias paru.m="man paru"

# ##############################################
# ################### YAY ######################
# ##############################################

# UPDATE and INSTALL PACKAGES
alias yay.ud="yay -Sy"
alias yay.ug="yay -Syu"
alias yay.uu="yay -Syyu"
alias yay.s="yay -S"
alias yay.r="yay -R"

# ##############################################
# ################### APT ######################
# ##############################################

# UPDATE and INSTALL PACKAGES
alias apt.uu="sudo apt update && sudo apt upgrade"
alias apt.ud="sudo apt update"
alias apt.ug="sudo apt upgrade"
alias apt.get="sudo apt-get update && apt-get upgrade"
# Delete apt-repo
alias apt.r="sudo add-apt-repository --remove"
# Add apt-repo
alias apt.a="sudo add-apt-repository"
# List Upgradable packages
alias apt.l='apt list --upgradable'
# Clean Packages
alias apt.c='sudo apt autoclean && sudo apt autoremove'

# ##############################################
# ################### NALA #####################
# ##############################################

# UPDATE and INSTALL PACKAGES
alias nala.uu="sudo nala update && sudo nala upgrade"
alias nala.ud="sudo nala update"
alias nala.ug="sudo nala upgrade"
alias nala.i="sudo nala install"
alias nala.r="sudo nala remove"

# ##############################################
# ############### FLATPAK ######################
# ##############################################

alias flatins="flatpak install flathub"
alias flatrem="flatpak remove"

# ##############################################
# ############### SNAP #########################
# ##############################################

alias snapins="sudo snap install"
alias snaprem="sudo snap remove"

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
# ############## DIRECTORY ALIASES #############
# ##############################################

# .config
alias zzconfig="~/.config"
alias zznvim="~/.config/nvim"

# Local user Backup
alias backup="sudo /home/oyinbra/Dotfiles/backup.sh"
alias backup.pkg="sudo rsync -aAXv --delete /var/cache/pacman/pkg /Backup"
# Local user Restore  
alias restore="sudo /home/oyinbra/Dotfiles/restore.sh"      

# Search for files or folders including hidden folders and files
alias list="ls -a | grep -i"

# Refresh zsh
alias sz="source ~/.zshrc"

# Zsh config
alias zxzshrc="nvim ~/.zshrc"

# Bash config
alias zxbash="nvim ~/.bashrc"

# Neofetch Distro
alias zxneofetch="nvim ~/.config/neofetch/config.conf"

# Zsh aliases config
alias zxalias="nvim ~/.config/zsh/aliases.zsh"
alias zxkitty="nvim ~/.config/kitty/kitty.conf"

#Dotfiles
alias zzdotfiles="~/Dotfiles"

# Work Directory
alias zzworkspace="cd ~/Workspace"
alias zzpython="cd ~/Workspace/python"
alias zzopensource="cd ~/Workspace/OpenSourceContribution/"

alias zzkitty="~/.config/kitty/"
# Project Directory
alias zzprojects="cd ~/Workspace/Projects"

# PKG Packages
alias zzpkg="/var/cache/pacman/pkg"

# Pictures Folder
alias zzpictures="~/Pictures"

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
# ############## MIRROR ALIASES ################
# ##############################################


# Configure Arch mirror list
alias zxarch.mirror="sudo vim /etc/pacman.d/mirrorlist"

# Configure EndeavourOS Mirror List
alias zxendeavouros.mirror="sudo vim /etc/pacman.d/endeavouros-mirrorlist"

# Configure Chaotic Mirror List
alias zxchaotic.mirror="sudo vim /etc/pacman.d/chaotic-mirrorlistt"

# Update Manjaro Mirrors
alias rate.manjaro="rate-mirrors --allow-root --protocol https manjaro | sudo tee /etc/pacman.d/mirrorlist"

# Update Arch Mirrors
alias rate.arch="rate-mirrors --allow-root --protocol https arch | sudo tee /etc/pacman.d/mirrorlist"
alias reflector.arch="sudo reflector --verbose --latest 10 --protocol https --sort rate --save /etc/pacman.d/mirrorlist"

# Update EndeavourOS mirror
alias rate.endeavouros="rate-mirrors --allow-root --protocol https endeavouros | sudo tee /etc/pacman.d/endeavouros-mirrorlist"

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

