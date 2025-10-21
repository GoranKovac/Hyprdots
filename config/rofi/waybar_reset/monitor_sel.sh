#!/bin/bash

# Current Theme
dir="$HOME/.config/rofi/monitor_sel/"
theme='style'

# CMDs
uptime="`uptime -p | sed -e 's/up //g' | sed -e 's/hour/hr/g' | sed -e 's/minute/min/g'`"

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
primary='Primary'
gamemode='GameMode'
gamemode_off='GameMode Off'
restart_waybar='Restart Waybar'
all='All'
roli='Connect Roli BT'
# lock='Lock'
# suspend='Suspend'
# logout='Logout'

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p " $USER" \
		-mesg " Uptime: $uptime" \
		-theme ${dir}/${theme}.rasi
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
    echo -e "$all\n$primary\n$gamemode\n$gamemode_off\n$roli\n$restart_waybar" | rofi_cmd
}

# Execute Command
run_cmd() {
	echo "$selected"
	    if [[ $1 == '--primary' ]]; then
			hyprctl keyword monitor DP-3,disable
    		hyprctl keyword monitor HDMI-A-1,disable
            notify-send "PRIMARY ONLY"
        elif [[ $1 == '--gamemode' ]]; then
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
		elif [[ $1 == '--all' ]]; then
           hyprctl keyword monitor DP-3,1920x1080@144.00,0x0,1
           hyprctl keyword monitor HDMI-A-1,848x480@60,4480x0,1
           notify-send "ALL MONITORS"
       elif [[ $1 == '--gamemode_off' ]]; then
           hyprctl reload config-only -q
           notify-send "HYPR GAME MODE OFF"
       elif [[ $1 == '--restart_waybar' ]]; then
           killall waybar && hyprctl dispatch exec waybar
           notify-send "Waybar Restarted"
       elif [[ $1 == '--roli' ]]; then
           bluetoothctl trust 48:B6:20:0A:5A:59
           bluetoothctl disconnect 48:B6:20:0A:5A:59
           bluetoothctl connect 48:B6:20:0A:5A:59
           notify-send "Roli BT Connected"
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
    $gamemode)
		run_cmd --gamemode
        ;;
    $gamemode_off)
		run_cmd --gamemode_off
            ;;
    $restart_waybar)
		run_cmd --restart_waybar
                    ;;
esac
