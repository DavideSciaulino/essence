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
    echo "Don't run as root. Use your regular user."
    exit 1
fi
    
clear
print_header
sleep 1

echo "Starting the installation process..."

#Update system
echo "Updating system..."
sudo pacman -Syu --noconfirm

clear
print_header
echo "Update finished successfully!"

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

#Source pkgs.sh
if [[ -f "$SCRIPT_DIR/pkgs.sh" ]]; then
    source "$SCRIPT_DIR/pkgs.sh"
else
    echo "Error: pkgs.sh not found!"
    exit 1
fi

#install pkgs
echo "Found ${#FINAL_PKGS[@]} pkgs"
echo "Starting the installation process..."

echo "Installing Hyprland packages..."
install_pkgs "${HYPR_PKGS[@]}"

echo "Installing UI packages..."
install_pkgs "${UI_PKGS[@]}"

echo "Installing Media packages..."
install_pkgs "${MEDIA_PKGS[@]}"

echo "Installing Fonts packages..."
install_pkgs "${FONTS_PKGS[@]}"

echo "Installing Utils packages..."
install_pkgs "${UTILS_PKGS[@]}"

echo "Installing Dev packages..."
install_pkgs "${DEV_PKGS[@]}"

echo "Installing Network packages..."
install_pkgs "${NET_PKGS[@]}"

echo "Installing User Choise packages..."
install_pkgs "${USER_CHOISE_PKGS[@]}"

# Enable services
echo "Configuring services..."
for service in "${SERVICES[@]}"; do
  if ! systemctl is-enabled "$service" &> /dev/null; then
    echo "Enabling $service..."
    sudo systemctl enable "$service"
  else
    echo "$service is already enabled"
  fi
done

if [[ " ${USER_CHOICE_PKGS[*]} " =~ " zsh " ]]; then
    print_msg "Imposto Zsh come default..."
    chsh -s $(which zsh) $USER
fi

echo "Done! Restart your system.
EOF