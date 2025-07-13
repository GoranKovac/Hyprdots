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
    nano
    
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

    #Fonts for waybar etc
    noto-fonts
    ttf-font-awesome

    #MP and Codecs
    vlc
    vlc-plugins-all

    #Faster search
    mlocate

    #Process, Gpu monitor
    htop
    nvtop

    firefox
    discord
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

cd ~
rm -f Hyperdots
