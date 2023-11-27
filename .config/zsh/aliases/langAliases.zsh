# ##############################################
# ############## PYTHON ALIASES ################
# ##############################################

# Activate or create environment variable for python in current directory if not available

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
alias py="python"

# Run python app
alias pyapp="python app.py"

# Run flask app with port 8000
alias flaskrun="flask run --port=8000"

# Deactivate myenv
# alias myenv.d="deactivate"

# Python version
alias pv="py --version"

# Pip3 List
alias pip.list="pip3 list"
alias pipug="pip3 install --upgrade"

# Switch Python Version
alias zxpython="sudo update-alternatives --config python3"
