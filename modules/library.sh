#!/bin/bash

cat << "EOF"

 █████        ███  █████                                             
░░███        ░░░  ░░███                                              
 ░███        ████  ░███████  ████████   ██████   ████████  █████ ████
 ░███       ░░███  ░███░░███░░███░░███ ░░░░░███ ░░███░░███░░███ ░███ 
 ░███        ░███  ░███ ░███ ░███ ░░░   ███████  ░███ ░░░  ░███ ░███ 
 ░███      █ ░███  ░███ ░███ ░███      ███░░███  ░███      ░███ ░███ 
 ███████████ █████ ████████  █████    ░░████████ █████     ░░███████ 
░░░░░░░░░░░ ░░░░░ ░░░░░░░░  ░░░░░      ░░░░░░░░ ░░░░░       ░░░░░███ 
                                                            ███ ░███ 
                                                           ░░██████  
                                                            ░░░░░░   

EOF

# ------------------------------------------------------
# Function: Is package installed
# ------------------------------------------------------
_isInstalledPacman() {
    package="$1";
    check="$(sudo pacman -Qs --color always "${package}" | grep "local" | grep "${package} ")";
    if [ -n "${check}" ] ; then
        echo 0; #'0' means 'true' in Bash
        return; #true
    fi;
    echo 1; #'1' means 'false' in Bash
    return; #false
}

_isInstalledYay() {
    package="$1";
    check="$(yay -Qs --color always "${package}" | grep "local" | grep "${package} ")";
    if [ -n "${check}" ] ; then
        echo 0; #'0' means 'true' in Bash
        return; #true
    fi;
    echo 1; #'1' means 'false' in Bash
    return; #false
}

# ------------------------------------------------------
# Function to install all Pacman packages if not installed
# ------------------------------------------------------
_installPackagesPacman() {
    toInstall=();

    for pkg; do
        if [[ $(_isInstalledPacman "${pkg}") == 0 ]]; then
            echo "${pkg} is already installed.";
            continue;
        fi;

        toInstall+=("${pkg}");
    done;

    if [[ "${toInstall[@]}" == "" ]] ; then
        # echo "All pacman packages are already installed.";
        return;
    fi;

    printf "Packages not installed:\n%s\n" "${toInstall[@]}";
    sudo pacman --noconfirm -S "${toInstall[@]}";
}

# ------------------------------------------------------
# Function to install all Yay packages if not installed
# ------------------------------------------------------
_installPackagesYay() {
    toInstall=();

    for pkg; do
        if [[ $(_isInstalledYay "${pkg}") == 0 ]]; then
            echo "${pkg} is already installed.";
            continue;
        fi;

        toInstall+=("${pkg}");
    done;

    if [[ "${toInstall[@]}" == "" ]] ; then
        # echo "All packages are already installed.";
        return;
    fi;

    printf "AUR ackages not installed:\n%s\n" "${toInstall[@]}";
    yay --noconfirm -S "${toInstall[@]}";
}

# ------------------------------------------------------
# Function to prompt for symlink creation
# ------------------------------------------------------
_installSymLink() {
    name="$1"           # Name of the symlink (for display purposes)
    symlink="$2"        # Path to the symlink
    linksource="$3"     # Source path for the symlink
    linktarget="$4"     # Target path for the symlink

    while true; do
        read -p "DO YOU WANT TO INSTALL ${name}? (Existing dotfiles will be removed!) (Yy/Nn): " yn
        case $yn in
            [Yy]* )
                # Check if the symlink exists
                if [ -e "${symlink}" ]; then
                    # Handle different types of existing targets
                    if [ -L "${symlink}" ]; then
                        rm "${symlink}"
                        ln -s "${linksource}" "${linktarget}"
                        echo "Symlink ${linksource} -> ${linktarget} created."
                        echo ""
                    elif [ -d "${symlink}" ]; then
                        rm -rf "${symlink}/"
                        ln -s "${linksource}" "${linktarget}"
                        echo "Symlink for directory ${linksource} -> ${linktarget} created."
                        echo ""
                    elif [ -f "${symlink}" ]; then
                        rm "${symlink}"
                        ln -s "${linksource}" "${linktarget}"
                        echo "Symlink to file ${linksource} -> ${linktarget} created."
                        echo ""
                    else
                        ln -s "${linksource}" "${linktarget}"
                        echo "New symlink ${linksource} -> ${linktarget} created."
                        echo ""
                    fi
                else
                    # If symlink doesn't exist, create a new one
                    ln -s "${linksource}" "${linktarget}"
                    echo "New symlink ${linksource} -> ${linktarget} created."
                    echo ""
                fi
                break;;
            [Nn]* )
                # If user chooses not to install, break out of the loop
                echo ""
                break;;
            * ) echo "Please answer yes or no.";;
        esac
    done
}
