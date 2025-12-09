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

    echo -e "\n[CHOICE] Which $category_name do you want to install?"
    echo "  1) $option1_name"
    echo "  2) $option2_name"
    read -p "Type 1 or 2 (Default 1): " choice

    case $choice in
        2)
            echo "$option2_pkg"
            ;;
        *)
            echo "$option1_pkg"
            ;;
    esac
}