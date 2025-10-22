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
    #gvfs-wsdd

    #Nautilus NEEDED FOR WINDOWS NETWORK DISCOVERY (MAYBE!!!)
    #gvfs-smb

    #Gamemode Daemon
    gamemode

    #Fonts for waybar etc
    noto-fonts
    ttf-font-awesome

    #MP and Codecs
    vlc
    vlc-plugins-all

    #Process, Gpu monitor, network
    htop
    nvtop
    iftop
    systemctl-tui
    nethogs
    iotop

    #Cpu temperature lib (to show copy up in htop)
    lm_sensors

    #Disk usage analyser
    ncdu

    #General
    firefox
    discord
    steam

    #TUI file manager
    yazi
    #fuzzy search for yazi
    fzf
    #better find for yazi
    fd
    #rip grep for yazi
    ripgrep

    #For Audio
    realtime-privileges
    #Node Audio Patchbay
    qpwgraph

    #Image viewer
    imv

    #torrent client
    transmission-gtk
)

sudo pacman -S "${pkgs[@]}"

sudo usermod -aG gamemode $USER
sudo usermod -aG realtime $USER

sudo cp -aT FixedSysEx /usr/share/fonts/TTF
# https://inai.de/projects/consoleet/
sudo cp -aT ConsoleetSysFX /usr/share/fonts/TTF

cp -aT config ~/.config
cp -aT Templates ~/Templates
cp .vimrc ~/
cp .vim ~/

#Install paru
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ..
sudo rm -r paru/

# #Best font in universe
# paru -S ttf-fixedsys-excelsior-linux

read -p "Install RME & Firewire fix? " -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    ./rme.sh
fi

read -p "Install GameDev Apps? " -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    ./gamedev.sh
fi

read -p "Install Reaper, ReaPack, Blender, Zed, Zig, Zls? " -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    ./apps.sh
fi

read -p "Update to Base MKINITCPIO for faster boot? " -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo sed -i 's/^HOOKS=(.*)/HOOKS=(base udev microcode modconf block filesystems fsck)/' /etc/mkinitcpio.conf
    sudo mkinitcpio -p linux
fi

read -p "Install Bluetooth for Roli? " -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    ./roli_bt.sh
fi

echo 'pacmaninstall () {
#pacman -Sl | awk \'{print $2($4=="" ? "" : " *INSTALLED")}\' | fzf --multi --preview \'pacman -Si {1}\' | cut -d " " -f 1 | xargs -ro sudo pacman -S
pacman -Sl | awk \'{print $2($4=="" ? "" : " *INSTALLED")}\' | fzf --border-label=" INSTALL PACKAGES " --border --multi --preview \'Items> \' \\
--header \'CTRL-F: Toggle Selected LIST, [TAB]: multi-select\' \\
--preview-label \' Package INFO \' \\
--preview \'pacman -Si {1}\' \\
--bind \'ctrl-f:transform:[[ $(</tmp/state) -eq 0 ]] &&
echo "execute-silent(echo 1 > /tmp/state)+change-preview-label( Selected Packages )+change-preview:cat \\{+f}" ||
echo "execute-silent(echo 0 > /tmp/state)+change-preview-label( Package )+change-preview:pacman -Si \\{1}"\' \\
| cut -d " " -f 1 | xargs -ro sudo pacman -S
}

pacmanremove () {
#pacman -Qqe | fzf --multi --preview \'pacman -Qi {1}\' | xargs -ro sudo pacman -Rns
pacman -Qqe | fzf --border-label=" REMOVE PACKAGES " --border --multi --preview \'Items> \' \\
--header \'CTRL-F: Toggle Selected LIST, [TAB]: multi-select\' \\
--preview-label \' Package INFO \' \\
--preview \'pacman -Qi {1}\' \\
--bind \'ctrl-f:transform:[[ $(</tmp/state) -eq 0 ]] &&
echo "execute-silent(echo 1 > /tmp/state)+change-preview-label( Selected Packages )+change-preview:cat \\{+f}" ||
echo "execute-silent(echo 0 > /tmp/state)+change-preview-label( Package )+change-preview:pacman -Qi \\{1}"\' \\
| xargs -ro sudo pacman -Rns
}

alias pinstall="pacmaninstall"
alias premove="pacmanremove"' >> .bashrc
