#!/bin/bash

# Current Theme
dir="$HOME/.config/rofi/config"
theme='style'

TERMINAL='kitty --class=NVIM'

show_update() {
    MANAGER=$(echo -e "Hyprland\nWaybar\nRofi" | rofi -dmenu -i -p -theme ${dir}/${theme}.rasi "Open")

    case "$MANAGER" in
    *"Hyprland"*)
        $TERMINAL -o confirm_os_window_close=0 -e bash -c "nvim ~/.config/hypr"
        ;;
    *"Waybar")
        $TERMINAL -o confirm_os_window_close=0 -e bash -c "nvim ~/.config/waybar"
        ;;
    *"Rofi")
        $TERMINAL -o confirm_os_window_close=0 -e bash -c "nvim ~/.config/rofi"
        ;;
    esac
}

show_update
