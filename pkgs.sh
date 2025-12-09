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
    dunst
)

# 3. Audio and Media
AUDIO_PKGS=(
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
    network-manager-applet       
)