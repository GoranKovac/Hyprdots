#!/bin/bash

# # Options
# hibernate=' hibernate'
# poweroff=' poweroff'
# reboot='⟳ Reboot'
# lock=' Lock'
# suspend=' Suspend'
# logout=' Logout'
# yes=' Yes'
# no=' No'
# Options
# hibernate='Hibernate'
primary='Primary Monitor'
all='All Monitors'
# lock='Lock'
# suspend='Suspend'
# logout='Logout'

# Rofi CMD
rofi_cmd() {
    fuzzel --dmenu -p "Monitors > "
}

# Confirmation CMD
# confirm_cmd() {
# 	rofi -markup-rows -dmenu \
# 		-p 'Confirmation' \
# 		-mesg 'Are you Sure?' \
# 		-theme ${dir}/confirmation.rasi
# }

# Pass variables to rofi dmenu
run_rofi() {
    echo -e "$all\n$primary" | rofi_cmd
}

# Execute Command
run_cmd() {
    echo "$selected"
    if [[ $1 == '--primary' ]]; then
        hyprctl keyword monitor DP-3,disable
        hyprctl keyword monitor HDMI-A-1,disable
        notify-send "PRIMARY ONLY"
    elif [[ $1 == '--all' ]]; then
        hyprctl keyword monitor DP-3,1920x1080@144.00,0x0,1
        hyprctl keyword monitor HDMI-A-1,848x480@60,4480x0,1
        notify-send "ALL MONITORS"
    fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
$primary)
    run_cmd --primary
    ;;
$all)
    run_cmd --all
    ;;
esac
