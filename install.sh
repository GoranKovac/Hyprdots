#!/bin/bash

pkgs=(
    hyprland

    #needed for drag and drop around
    xdg-desktop-portal-hyprland

    #needed for drag and drop around
    xdg-desktop-portal-gtk

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

    #Nautilus NEEDED FOR WINDOWS NETWORK DISCOVERY (DEFFINATLY)
    gvfs-wsdd

    #Nautilus NEEDED FOR WINDOWS NETWORK DISCOVERY (MAYBE!!!)
    gvfs-smb

    #usb mounting
    udiskie

    #screen recorder
    wf-recorder

    #RME/Reaper/JACK
    realtime-privileges

    #RME not to bugout with firewire
    rtirq

    #Gamemode Daemon
    gamemode

    #Programs
    vlc
    vlc-plugins-all

    firefox

    discord

    steam

    pavucontrol

    zed

    zls

    ttf-font-awesome

    nano

    kitty

    fish

    godot

    blender

    reaper

    reapack

    htop

    nvtop

    noto-fonts

    yazi

    mlocate
)

sudo pacman -S "${pkgs[@]}"

#Add config for RME not to bug out
sudo sed -i 's/RTIRQ_NAME_LIST=".\+"/RTIRQ_NAME_LIST="firewire xhci_hcd snd snd-usb i8042"'/ /etc/rtirq.conf

## add user to realtime and gamemode group
sudo usermod -aG realtime $USER
sudo usermod -aG gamemode $USER

cp -aT config ~/.config

mkdir -p ~/Pictures/Wallpapers
curl https://raw.githubusercontent.com/Larcele/8-bit-day/refs/heads/master/07-Early-Evening.png -o ~/Pictures/Wallpapers/8bitday.png

sudo updatedb

sudo chmod +x ~/.config/waybar/waybar-screenrecorder/screenrecorder2
sudo chmod +x ~/.config/rofi/launcher/launcher.sh
sudo chmod +x ~/.config/rofi/run/run.sh
sudo chmod +x ~/.config/rofi/locate/rofi-locate.sh
sudo chmod +x ~/.config/hypr/hypr_gamemode.sh

sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

paru -S ttf-fixedsys-excelsior-linux
