#!/bin/bash

# ==============================================================================
# DEFINITION OF PACKAGE CATEGORIES
# ==============================================================================

# 1. Hyprland Core
HYPR_PKGS=(
    hyprland
    xdg-desktop-portal-hyprland  
    polkit                       
    sddm
    grim                         
    slurp                        
    hyprpaper                    
    wl-clipboard                 
)

# 2. UI (Bar, Menu, Notifications)
UI_PKGS=(
    waybar
    rofi
    swaync
)

# 3. Audio and Media
MEDIA_PKGS=(
    pipewire
    pipewire-pulse
    wireplumber
    pavucontrol                   
    vlc
    gimp
)

# 4. Fonts e Temi (Fondamentali per le icone)
FONTS_PKGS=(
    ttf-jetbrains-mono-nerd
    noto-fonts-emoji
    qt5-wayland                 
    qt6-wayland                  
)

UTILS_PKGS=(
    btop  
    curl
    wget
    fastfetch
    fzf
    7zip
)

# 5. Strumenti di Sviluppo e Sistema
DEV_PKGS=(
    git
    vim
    neovim                      
    nano                         
)

# 6. Network (Opzionale ma consigliato)
NET_PKGS=(
    networkmanager
    network-manager-applet       
)

# Services to enable
SERVICES=(
  NetworkManager.service
)

echo "Configuring user preferences..."

#Custom pkgs
USER_CHOICE_PKGS=()

#File Manager
FM=$(ask_choice "File Manager" "Thunar" "thunar" "Yazi" "yazi")
USER_CHOICE_PKGS+=("$FM")

if [[ "$FM" == "yazi" ]]; then
    USER_CHOICE_PKGS+=(ffmpeg poppler)
elif [[ "$FM" == "thunar" ]]; then
    USER_CHOICE_PKGS+=(thunar-archive-plugin)
fi

# Terminale
TERM=$(ask_choice "Terminal" "Kitty" "kitty" "Alacritty" "alacritty")
USER_CHOICE_PKGS+=("$TERM")

# Browser
BROWSER=$(ask_choice "Browser" "Firefox" "firefox" "Brave" "brave-bin")
USER_CHOICE_PKGS+=("$BROWSER")

# Shell
SHELL_CHOICE=$(ask_choice "Shell" "Bash" "bash-completion" "Zsh" "zsh")
USER_CHOICE_PKGS+=("$SHELL_CHOICE")

echo "Preparing packages list..."

#Final List (used for info)
FINAL_PKGS=(
    "${HYPR_PKGS[@]}"
    "${UI_PKGS[@]}"
    "${AUDIO_PKGS[@]}"
    "${FONTS_PKGS[@]}"
    "${DEV_PKGS[@]}"
    "${NET_PKGS[@]}"
    "${USER_CHOICE_PKGS[@]}"
)