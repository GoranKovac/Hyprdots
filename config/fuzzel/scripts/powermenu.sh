#!/bin/bash

SELECTION="$(printf "1 - Log out\n2 - Reboot\n3 - Reboot to UEFI\n4 - Shutdown" | fuzzel --dmenu -w 15 -l 4 -p "Power Menu > ")"

case $SELECTION in
*"Log out")
    hyprctl dispatch exit
    ;;
*"Reboot")
    systemctl reboot
    ;;
*"Reboot to UEFI")
    systemctl reboot --firmware-setup
    ;;
*"Shutdown")
    systemctl poweroff
    ;;
esac
