#!/bin/zsh

v() {
    # Use find to list files in the current directory, relative paths only
    local file=$(find . -type f -printf "%P\n" | fzf --preview "cat {}" --height 40%)

    # If a file is selected, open it with nvim
    if [ -n "$file" ]; then
        nvim "$file"
    else
        # If no file is selected, ask the user for a new filename
        read -p "Enter a new filename: " newfile

        # If the file doesn't exist, create and open it with nvim
        if [ ! -z "$newfile" ]; then
            nvim "$newfile"
        fi
    fi
}
