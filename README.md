# Essence

> "Simplicity is the ultimate sophistication."
>  — *Leonardo da Vinci*

**Essence** is a modular and interactive setup script designed to transform a fresh Arch Linux installation into a complete, fast, and minimal **Hyprland** environment.

Unlike standard monolithic scripts, Essence is split into **modules** and installs packages by **logical categories**, offering a clean process that is easy to read, debug, and customize.

![License](https://img.shields.io/github/license/DavideSciaulino/essence?style=flat-square)
![Bash](https://img.shields.io/badge/Language-Bash-4EAA25?style=flat-square&logo=gnu-bash)
![Arch](https://img.shields.io/badge/Distro-Arch_Linux-1793D1?style=flat-square&logo=arch-linux)

## ✨ Features

* **🧩 Modular Architecture**: Code is separated into logic (`run.sh`), functions (`utils.sh`), and definitions (`pkgs.sh`).
* **🗂️ Category-based Installation**: Packages are installed sequentially (Core, UI, Audio, Font, Dev) for clear feedback and immediate debugging.
* **🎮 Interactive Choices**: It doesn't force a workflow on you. You choose:
    * **File Manager**: `Thunar` (Classic GUI) or `Yazi` (Terminal-based, Vim-like).
    * **Terminal**: `Kitty` (GPU Accelerated) or `Alacritty` (Minimalist).
    * **Browser**: `Firefox` or `Brave`.
    * **Shell**: `Bash` or `Zsh`.
* **⚡ Automatic AUR Helper**: Detects, compiles, and installs `yay` if missing.
* **🎨 Ready-to-Rice**: Includes essential Nerd Fonts, icons, and pre-configured Hyprland portals.

## 📂 Project Structure

Essence is designed to be readable and maintainable. Here is the layout:

    essence/
    ├── run.sh          # The orchestrator: manages the main flow
    ├── utils.sh        # The functions: logging, colors, and install logic
    └── pkgs.sh         # The data: package lists and category definitions

## 🚀 Installation

Run these commands on a fresh Arch Linux installation:

    # 1. Install git (if missing)
    sudo pacman -S git

    # 2. Clone the repository
    git clone https://github.com/DavideSciaulino/essence.git

    # 3. Enter the directory
    cd essence

    # 4. Make the script executable and run it
    chmod +x run.sh
    ./run.sh

> **Note:** Do not run the script as `root`. The script will ask for `sudo` permissions only when necessary to install packages.

## 📦 What gets installed?

The script divides the installation into these logical groups (editable in `pkgs.sh`):

1.  **Hyprland Core**: The compositor, XDG portals, clipboard management, wallpaper utility and more.
2.  **User Interface**: waybar (status bar), rofi (menu/launcher), swaync (notifications center).
3.  **Audio & Media**: pipewire, wireplumber, wavucontrol, vlc and gimp.
4.  **Fonts & Themes**: JetBrains Nerd Font (for icons), Noto Emoji, Qt themes.
5.  **Utils**: btop, fastfetch, 7zip and more.
6.  **Dev & Tools**: git, neovim, vim.
7.  **Network**: NetworkManager and nm-applet.
8.  **User Choice**: The software you selected during startup (Browser, Shell, Terminal, etc.).

## 🛠️ Customization

Want to add or remove packages without breaking everything? It's simple:

1.  Open the `pkgs.sh` file with your preferred editor.
2.  Find the array of the category you are interested in (e.g., `DEV_PKGS` or `UI_PKGS`).
3.  Add or remove the package name from the list.
4.  Save and run the script.

## 🤝 Contributing

The project is open to everyone! Feel free to open an Issue or a Pull Request if you have ideas to improve the code or add new options.

## 📄 License

This project is distributed under the **MIT** License. See the `LICENSE` file for more details.