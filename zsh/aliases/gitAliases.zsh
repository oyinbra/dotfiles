#!/bin/zsh

# ███ ███ ███   ███ █   ███ ███ ███ ███ ███
# █    █   █    █ █ █    █  █ █ █   █   █
# █    █   █    █ █ █    █  █ █  █  ███  █
# █ █  █   █    ███ █    █  ███   █ █     █
# ███ ███  █    █ █ ███ ███ █ █ ███ ███ ███

# Lazy Git
alias lg="lazygit"

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
alias grao="git remote add origin"

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
alias gpull="git pull"

# replace the entire history of one branch with another. 
alias grb="git rebase"

# Create a new commit to undo changes of last commit without deleting history
alias grvh="git revert HEAD"

# Unstaged changes when used with options or specific files/folders
alias gr="git reset"

# Create a new commit to undo changes of last commit and deleting it from history
alias grh-1="git reset HEAD~1"
alias grh-2="git reset HEAD~2"
alias grh-3="git reset HEAD~3"

# Reset local branch to origin main branch
alias grm="git reset --hard origin/main"

# Create a new commit to undo changes of last commit and delete unstaged changes
alias grshh="git reset --hard HEAD~1"

# Check the remote link
alias gl="git remote -v"
# Set fetch url for remote origin 
alias glf="git remote set-url origin"
# Set push url for remote origin
alias glp="git remote set-url --push origin"
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

