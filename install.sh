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

    #usb auto mount
    udiskie

    #wallpaper manager
    hyprpaper

    #color picker
    hyprpicker

    #Screenshot tool
    hyprshot

    #status bar
    waybar

    #launcher
    rofi-wayland

    #screen recorder
    wf-recorder

    #clipboard manager
    cliphist

    #clipboard copy persist (keep copy data if app is closed)
    wl-clip-persist

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

    #Disk usage analyser
    ncdu

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
    ripgrep
)

sudo pacman -S "${pkgs[@]}"

sudo usermod -aG gamemode $USER

cp -aT config ~/.config
cp .vimrc ~/
cp .vim ~/

mkdir -p ~/Pictures/Wallpapers
curl https://raw.githubusercontent.com/Larcele/8-bit-day/refs/heads/master/07-Early-Evening.png -o ~/Pictures/Wallpapers/8bitday.png

#Install paru
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ..

#Best font in universe
paru -S ttf-fixedsys-excelsior-linux

read -p "Install RME & ProAudio? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    ./rme.sh
fi

read -p "Install Steam, Reaper, Godot, Blender and other friends? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    ./apps.sh
fi

read -p "Update to Base mkinitcpio for faster boot? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo sed -i 's/^HOOKS=(.*)/HOOKS=(systemd autodetect microcode modconf block filesystems fsck)/' /etc/mkinitcpio.conf
    sudo mkinitcpio -p linux
fi
