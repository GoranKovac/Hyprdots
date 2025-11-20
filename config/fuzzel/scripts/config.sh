#!/bin/bash

TERMINAL='foot -a NVIM'

show_update() {
    MANAGER=$(echo -e "Hyprland\nWaybar\nFuzzel" | fuzzel --dmenu -i -p "Config > ")

    case "$MANAGER" in
    *"Hyprland"*)
        $TERMINAL -e bash -c "nvim ~/.config/hypr"
        ;;
    *"Waybar")
        $TERMINAL -e bash -c "nvim ~/.config/waybar"
        ;;
    *"Fuzzel")
        $TERMINAL -e bash -c "nvim ~/.config/fuzzel"
        ;;
    esac
}

show_update
