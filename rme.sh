#!/bin/bash

pkgs=(
    #RME800/Reaper/JACK
    realtime-privileges

    #RME800 not to bugout with firewire
    rtirq

    #RME FFADO-MIXER (CONTROL PANEL)
    libffado
    python-pyqt5

    #Node Audio Patchbay
    qpwgraph
)

sudo pacman -S "${pkgs[@]}"

#Add config for RME800 not to bug out (increases priority to firewire card)
sudo sed -i 's/RTIRQ_NAME_LIST=".\+"/RTIRQ_NAME_LIST="firewire xhci_hcd snd snd-usb i8042"'/ /etc/rtirq.conf

## add user to realtime and gamemode group
sudo usermod -aG realtime $USER
