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

    vlc
    vlc-plugins-all

    firefox

    discord

    steam

    pavucontrol

    zed

    zls

    ttf-font-awesome

    paru

    nano

    kitty

    fish

    mlocate
)

sudo pacman -S "${pkgs[@]}"

#Add config for RME not to bug out
sudo sed -i 's/RTIRQ_NAME_LIST=".\+"/RTIRQ_NAME_LIST="firewire xhci_hcd snd snd-usb i8042"'/ /etc/rtirq.conf

## add user to realtime and gamemode group
sudo usermod -aG realtime $USER
sudo usermod -aG gamemode $USER

cp -aT config ~/.config

sudo updatedb
