#!/bin/zsh

# ███ ███ ███   ███ █   ███ ███ ███ ███ ███
# █    █   █    █ █ █    █  █ █ █   █   █
# █    █   █    █ █ █    █  █ █  █  ███  █
# █ █  █   █    ███ █    █  ███   █ █     █
# ███ ███  █    █ █ ███ ███ █ █ ███ ███ ███

vcg() {
  # Define an associative array with Git commands
  declare -A commands=(
    ["Initialize New Git Repository"]="git init"
    ["Create README.md"]="touch README.md"
    ["Add All Files in Current Directory"]="git add ."
    ["Add All Changes (Including Deletions)"]="git add --all"
    ["Commit with Message"]="git_commit"
    ["Amend Last Commit Message"]="git_amend_commit"
    ["Add Remote Origin"]="git_remote_add"
    ["Set Default Branch to Main"]="git branch -M main"
    ["Push Initial Commit to Origin"]="git push -u origin main"
    ["Push to Current Branch"]="git push"
    ["Force Push to Current Branch"]="git push -f"
    ["Check Git Status"]="git status"
    ["List Git Branches"]="git branch"
    ["Rename Current Branch"]="git_rename_branch"
    ["Checkout Branch"]="git_checkout"
    ["Create and Switch to New Branch"]="git_create_branch"
    ["Fetch Remote Data"]="git fetch"
    ["Merge Current Branch with Remote"]="git merge"
    ["Pull Changes from Remote"]="git pull"
    ["Rebase Branch"]="git rebase"
    ["Revert Last Commit"]="git revert HEAD"
    ["Reset Staged Changes"]="git reset"
    ["Hard Reset to HEAD~1"]="git reset --hard HEAD~1"
    ["Hard Reset to HEAD~2"]="git reset --hard HEAD~2"
    ["Hard Reset to HEAD~3"]="git reset --hard HEAD~3"
    ["Reset Local to Remote on Main"]="git fetch origin && git reset --hard origin/main && git clean -fd"
    ["Check Remote URLs"]="git remote -v"
    ["Set Fetch URL for Origin"]="git_set_fetch_url"
    ["Set Push URL for Origin"]="git_set_push_url"
    ["View Git Log"]="git log"
    ["Unstage Files"]="git rm --cached"
    ["Enable Fast-Forward Merges"]="git config --global pull.ff true"
    ["Configure Global Git Ignore"]="git_configure_global_ignore"
    ["Edit .gitignore in Current Directory"]="edit_repo_gitignore"
    ["Quit"]=": # Quit the function"
  )

  # Helper functions for commands requiring additional input
  git_commit() {
    echo -n "Enter commit message: "
    read msg
    if [[ -z "$msg" ]]; then
      echo "Aborting commit due to empty commit message."
      return 1
    fi
    git commit -m "$msg"
  }

  git_amend_commit() {
    echo -n "Enter new commit message: "
    read msg
    if [[ -z "$msg" ]]; then
      echo "Aborting amend due to empty commit message."
      return 1
    fi
    git commit --amend -m "$msg"
  }

  git_remote_add() {
    echo -n "Enter remote name (e.g., origin): "
    read remote_name
    echo -n "Enter remote URL: "
    read remote_url
    git remote add "$remote_name" "$remote_url"
  }

  git_rename_branch() {
    echo -n "Enter new branch name: "
    read new_branch
    git branch -m "$new_branch"
  }

  git_checkout() {
    echo -n "Enter branch name to checkout: "
    read branch
    git checkout "$branch"
  }

  git_create_branch() {
    echo -n "Enter new branch name: "
    read branch
    git checkout -b "$branch"
  }

  git_set_fetch_url() {
    echo -n "Enter remote name: "
    read remote_name
    echo -n "Enter new fetch URL: "
    read url
    git remote set-url "$remote_name" "$url"
  }

  git_set_push_url() {
    echo -n "Enter remote name: "
    read remote_name
    echo -n "Enter new push URL: "
    read url
    git remote set-url --push "$remote_name" "$url"
  }

  git_configure_global_ignore() {
    git config --global core.excludesfile ~/.gitignore_global
    echo "Global .gitignore is set to ~/.gitignore_global. Edit it to include your global ignore patterns."
    nvim ~/.gitignore_global
  }

  edit_repo_gitignore() {
    if [[ -f .gitignore ]]; then
      nvim .gitignore
    else
      echo ".gitignore file does not exist in the current directory. Creating one..."
      touch .gitignore
      nvim .gitignore
    fi
  }

  while true; do
    # Use fzf to display the commands and store the selection
    local choice=$(printf "%s\n" "${(@k)commands}" | fzf --height 10 --prompt "Select a Git command (or Quit): " --border)

    # If no command is selected or 'Quit' is chosen, exit the loop
    if [[ -z "$choice" || "$choice" == "Quit" ]]; then
      echo "Exiting Git Command Manager."
      break
    fi

    # Execute the selected command
    eval "${commands[$choice]}"
  done
}
