#!/bin/bash

pkgs=(
    hyprland

    #needed for drag and drop around
    xdg-desktop-portal-hyprland

    #needed for drag and drop around
    xdg-desktop-portal-gtk

    #Default hyprland terminal
    kitty

    #Shell with autocomplete etc
    fish

    #CLI editor
    vim

    #Needed for audio control
    pavucontrol

    #wallpaper manager
    hyprpaper

    #color picker
    hyprpicker

    #Screenshot tool
    hyprshot

    #status bar
    waybar

    #launcher
    rofi

    #screen recorder
    wf-recorder

    #clipboard manager
    cliphist

    #notifications
    dunst

    #remembering logins (git etc)
    gnome-keyring

    #file manager
    nautilus

    #Nautilus NEEDED FOR WINDOWS NETWORK DISCOVERY (DEFINITELY)
    gvfs-wsdd

    #Nautilus NEEDED FOR WINDOWS NETWORK DISCOVERY (MAYBE!!!)
    gvfs-smb

    #Gamemode Daemon
    gamemode

    #Fonts for waybar etc
    noto-fonts
    ttf-font-awesome

    #MP and Codecs
    vlc
    vlc-plugins-all

    #Process, Gpu monitor
    htop
    nvtop

    #General
    firefox
    discord

    #TUI file manager
    yazi
    #fuzzy search for yazi
    fzf
    #better find for yazi
    fd
    #rip grep for yazi
    rg
)

sudo pacman -S "${pkgs[@]}"

sudo usermod -aG gamemode $USER

cp -aT config ~/.config
cp .vimrc ~/
cp .vim ~/

mkdir -p ~/Pictures/Wallpapers
curl https://raw.githubusercontent.com/Larcele/8-bit-day/refs/heads/master/07-Early-Evening.png -o ~/Pictures/Wallpapers/8bitday.png

sudo chmod +x ~/.config/waybar/waybar-screenrecorder/screenrecorder2
sudo chmod +x ~/.config/rofi/launcher/launcher.sh
sudo chmod +x ~/.config/rofi/locate/rofi-locate.sh
sudo chmod +x ~/.config/rofi/monitor_sel/monitor_sel.sh
sudo chmod +x ~/.config/rofi/powermenu/powermenu.sh
sudo chmod +x ~/.config/rofi/run/run.sh
sudo chmod +x ~/.config/hypr/scripts/hypr_gamemode.sh
sudo chmod +x ~/.config/hypr/scripts/hdrop.sh
sudo chmod +x ~/.config/hypr/scripts/hpick.sh

sudo chmod +x ~/.config/hypr/apps.sh
sudo chmod +x ~/.config/hypr/rme.sh

#Install paru
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ..

#Best font in universe
paru -S ttf-fixedsys-excelsior-linux
