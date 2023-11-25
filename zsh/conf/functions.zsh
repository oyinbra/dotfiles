#!/bin/zsh

#  ████████                            ██   ██
# ░██░░░░░                            ░██  ░░
# ░██       ██   ██ ███████   █████  ██████ ██  ██████  ███████   ██████
# ░███████ ░██  ░██░░██░░░██ ██░░░██░░░██░ ░██ ██░░░░██░░██░░░██ ██░░░░
# ░██░░░░  ░██  ░██ ░██  ░██░██  ░░   ░██  ░██░██   ░██ ░██  ░██░░█████
# ░██      ░██  ░██ ░██  ░██░██   ██  ░██  ░██░██   ░██ ░██  ░██ ░░░░░██
# ░██      ░░██████ ███  ░██░░█████   ░░██ ░██░░██████  ███  ░██ ██████
# ░░        ░░░░░░ ░░░   ░░  ░░░░░     ░░  ░░  ░░░░░░  ░░░   ░░ ░░░░░░

#------------------------------------------------------
# Function to run figlet with font command
#------------------------------------------------------
# usage: myfiglet "Repairs" OR myfiglet "Repairs" 3d
#------------------------------------------------------
font() {
    # Check if the correct number of arguments is provided
    if [ "$#" -lt 1 ]; then
        echo "Usage: myfiglet <text> [font]"
        return 1
    fi

    # Assign the text and font to variables
    text="$1"
    font="${2:-standard}"

    # Define the default font
    default_font="standard"

    # Check if the default font is selected
    if [ "$font" = "$default_font" ]; then
        figlet_cmd="figlet \"$text\""
    else
        figlet_cmd="figlet -t -f $font \"$text\""
    fi

    # Pipe the figlet command to lolcat
    final_cmd="$figlet_cmd | lolcat"

    # Execute the final command
    eval "$final_cmd"
}

# -------------------------------------------------------
# Function to load environment variables
# -------------------------------------------------------
load_environment() {
  if [ -f "$ENV_FILE" ]; then
    source "$ENV_FILE"
  else
    echo "Warning: $ENV_FILE not found. Consider creating it with your environment variables." >&2
  fi
}

load_environment

# -------------------------------------------------------
# SSH Alias for Kitty Terminal: 
# -------------------------------------------------------
if [[ $TERM == "xterm-kitty" ]]; then
  alias ssh="kitty +kitten ssh"
fi

# -------------------------------------------------------
# OS-specific Aliases
# -------------------------------------------------------
case "$(uname -s)" in

Darwin)
	# echo 'Mac OS X'
	alias ls='ls -G'
	;;

Linux)
	# alias ls='ls --color=auto'
	;;

CYGWIN* | MINGW32* | MSYS* | MINGW*)
	# echo 'MS Windows'
	;;
*)
	# echo 'Other OS'
	;;
esac

