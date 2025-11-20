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
# primary='Primary'
gamemode='GameMode On'
gamemode_off='GameMode Off'
# restart_waybar='Restart Waybar'
# all='All'
# roli='Connect Roli BT'
# lock='Lock'
# suspend='Suspend'
# logout='Logout'

# Rofi CMD
rofi_cmd() {
    fuzzel --dmenu -p "HyprGameMode "
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
    echo -e "$gamemode\n$gamemode_off" | rofi_cmd
}

# Execute Command
run_cmd() {
    echo "$selected"
    if [[ $1 == '--gamemode' ]]; then
        # Hyprland performance
        hyprctl -q --batch "\
                    keyword animations:enabled 0;\
                    keyword decoration:shadow:enabled 0;\
                    keyword decoration:blur:xray 1;\
                    keyword decoration:blur:enabled 0;\
                    keyword general:gaps_in 0;\
                    keyword general:gaps_out 0;\
                    keyword general:border_size 1;\
                    keyword decoration:rounding 0 ;\
                    keyword decoration:active_opacity 1 ;\
                    keyword decoration:inactive_opacity 1 ;\
                    keyword decoration:fullscreen_opacity 1 ;\
                    keyword layerrule noanim,waybar ;\
                    keyword layerrule noanim,swaync-notification-window ;\
                    keyword layerrule noanim,swww-daemon ;\
                    keyword layerrule noanim,rofi
                    "
        hyprctl 'keyword windowrule opaque,class:(.*)' # ensure all windows are opaque
        notify-send "HYPR GAME MODE ON"
    elif [[ $1 == '--gamemode_off' ]]; then
        hyprctl reload config-only -q
        notify-send "HYPR GAME MODE OFF"
    fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
$gamemode)
    run_cmd --gamemode
    ;;
$gamemode_off)
    run_cmd --gamemode_off
    ;;
esac
