#!/bin/bash

# ==============================================================================
#  _____                                 
# | ____|___ ___  ___ _ __   ___ ___     
# |  _| / __/ __|/ _ \ '_ \ / __/ _ \    
# | |___\__ \__ \  __/ | | | (_|  __/    
# |_____|___/___/\___|_| |_|\___\___|    
#
# Essence - Arch Linux Hyprland Bootstrapper
# ==============================================================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

#Source utils.sh
if [[ -f "$SCRIPT_DIR/utils.sh" ]]; then
    source "$SCRIPT_DIR/utils.sh"
else
    echo "Error: utils.sh not found!"
    exit 1
fi

# Root check
if [ "$EUID" -eq 0 ]; then
    print_error "Don't run as root. Use your regular user."
    exit 1
fi
    
clear
print_header
sleep 1

echo "Starting the installation process..."

#Update system
echo "Updating system..."
#sudo pacman -Syu --noconfirm #remove comment: now disabled for debugging 

# Install yay
if ! command -v yay &> /dev/null; then
  echo "Installing yay (AUR helper)..."
  sudo pacman -S --needed git base-devel --noconfirm
  if [[ ! -d "yay" ]]; then
    echo "Cloning yay repository..."
  else
    echo "yay directory already exists, removing it..."
    rm -rf yay
  fi

  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si --noconfirm
  cd ..
  rm -rf yay
else
  echo "yay is already installed"
fi