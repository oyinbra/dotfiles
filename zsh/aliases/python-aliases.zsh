#!/bin/zsh

# ███ █ █ ███ █ █ ███ █   █   ███ █   ███ ███ ███ ███ ███
# █ █ █ █  █  █ █ █ █ ██  █   █ █ █    █  █ █ █   █   █
# ███  █   █  ███ █ █ █ █ █   █ █ █    █  █ █  █  ███  █
# █    █   █  █ █ █ █ █  ██   ███ █    █  ███   █ █     █
# █    █   █  █ █ ███ █   █   █ █ ███ ███ █ █ ███ ███ ███

# -------------------------------------------
# Activate or create environment variable for python in current directory if not available
# -------------------------------------------
myenv() {
    venv_name="myenv"

    if [ -d "$venv_name" ]; then
        source "$venv_name/bin/activate"
    else
        python -m venv "$venv_name"
        source "$venv_name/bin/activate"
    fi
}

# Python alias
# alias py="python"

# Run python app
alias pyapp="python app.py"

# Run flask app with port 8000
alias flaskrun="flask run --port=8000"

# Python version
alias pv="py --version"

# Pip3 List
alias pip.list="pip3 list"
alias pipug="pip3 install --upgrade"

# Switch Python Version
alias zxpython="sudo update-alternatives --config python3"

# Run python
p() {
    local file
    file=$( (echo "main.py"; find . -type f -name "*.py" ! -path "./myenv/*" ! -path "./__pycache__/*" ! -name "main.py" | sed 's|^\./||') | fzf --preview "bat --style=numbers --color=always --line-range :500 {}" --height 40% --border --ansi)
    if [[ -n "$file" ]]; then
        python "$file"
    else
        echo "No file selected"
    fi
}

