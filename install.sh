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
    
clear
print_header