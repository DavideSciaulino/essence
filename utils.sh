#!/bin/bash

#Print logo
print_header(){
    cat << "EOF"

     ______                             
    / ____/____________  ____  ________ 
   / __/ / ___/ ___/ _ \/ __ \/ ___/ _ \
  / /___(__  |__  )  __/ / / / /__/  __/        Arch Linux Hyprland Bootstrapper
 /_____/____/____/\___/_/ /_/\___/\___/         losciau
                                       
EOF
}

#Asks the user to choose between two options
ask_choice(){
    local category_name=$1
    local option1_name=$2
    local option1_pkg=$3
    local option2_name=$4
    local option2_pkg=$5

    echo "[CHOICE] Which $category_name do you want to install?" >&2
    echo "  1) $option1_name" >&2
    echo "  2) $option2_name" >&2
    read -p "Type 1 or 2 (Default 1): " choise

    case $choice in
        2)
            echo "$option2_pkg"
            ;;
        *)
            echo "$option1_pkg"
            ;;
    esac
}

#Check if a package is installed
is_installed() {
  pacman -Qi "$1" &> /dev/null
}

#Check if a package is installed
is_group_installed() {
  pacman -Qg "$1" &> /dev/null
}

# Function to install packages if not already installed
install_pkgs() {
  local pkgs=("$@")
  local pkgs_needed=()

  for pkg in "${pkgs[@]}"; do
    if ! is_installed "$pkg" && ! is_group_installed "$pkg"; then
      pkgs_needed+=("$pkg")
    fi
  done

  if [ ${#pkgs_needed[@]} -ne 0 ]; then
    echo "Installing: ${pkgs_needed[*]}"
    yay -S --noconfirm "${pkgs_needed[@]}"
  fi
} 