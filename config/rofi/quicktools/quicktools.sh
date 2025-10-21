#!/bin/bash

# Current Theme
dir="$HOME/.config/rofi/quicktools/"
theme='style'

# CMDs
uptime="`uptime -p | sed -e 's/up //g' | sed -e 's/hour/hr/g' | sed -e 's/minute/min/g'`"

primary='Primary Monitor'
gamemode='GameMode'
gamemode_off='GameMode Off'
restart_waybar='Restart Waybar'
all='All Monitors'
install='Install'
remove='Remove'
update='Update'
# roli='Connect Roli BT'

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
    echo -e "$all\n$primary\n$gamemode\n$gamemode_off\n$install\n$remove\n$update\n$restart_waybar" | rofi_cmd
}

show_install() {
    MANAGER=$(echo -e "󰏖 Pacman\n󰣇 Paru" | rofi -dmenu -i -p -theme ${dir}/${theme}.rasi "Update with")

    case "$MANAGER" in
            *"Pacman")
                kitty -e bash -c "$HOME/.config/hypr/scripts/install.sh"
                ;;
            *"Paru")
                kitty -e bash -c "$HOME/.config/hypr/scripts/paruinstall.sh"
                ;;
    esac
}

show_update() {
    MANAGER=$(echo -e "󰏖 Pacman\n󰣇 Paru\n󰚰 All Packages (Pacman & Paru)" | rofi -dmenu -i -p -theme ${dir}/${theme}.rasi "Update with")

    case "$MANAGER" in
        *"All Packages"*)
            kitty -e bash -c "echo 'Updating all packages...sudo pacman -Syu, paru -Sua'; paru -Syu; echo 'Update complete!'; read -p 'Press enter to close...'"
            ;;
        *"Pacman")
            kitty -e bash -c "echo sudo pacman -Syu; sudo pacman -Syu; read -p 'Press enter to close...'"
            ;;
        *"Paru")
            kitty -e bash -c "echo paru -Sua; paru -Sua; read -p 'Press enter to close...'"
            ;;
    esac
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
       elif [[ $1 == '--install' ]]; then
           show_install
       elif [[ $1 == '--remove' ]]; then
           kitty -e "$HOME/.config/hypr/scripts/remove.sh"
       elif [[ $1 == '--update' ]]; then
            show_update
       # elif [[ $1 == '--roli' ]]; then
       #     bluetoothctl trust 48:B6:20:0A:5A:59
       #     bluetoothctl disconnect 48:B6:20:0A:5A:59
       #     bluetoothctl connect 48:B6:20:0A:5A:59
       #     notify-send "Roli BT Connected"
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
    $install)
    run_cmd --install
    ;;
    $remove)
    run_cmd --remove
    ;;
    $update)
    run_cmd --update
    ;;
esac
