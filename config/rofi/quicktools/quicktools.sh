#!/bin/bash

# Current Theme
dir="$HOME/.config/rofi/quicktools/"
theme='style'

TERMINAL='kitty --class=SYS'

# CMDs
uptime="`uptime -p | sed -e 's/up //g' | sed -e 's/hour/hr/g' | sed -e 's/minute/min/g'`"

monitors='Monitors'
gamemode='GameMode'
# gamemode_off='GameMode Off'
restart_waybar='Restart Waybar'
# all='All Monitors'
# install='Install'
# remove='Remove'
update='Update System'
tui='TUI Tools'
addremove='Install/Remove App'
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
    echo -e "$monitors\n$gamemode\n$addremove\n$update\n$tui\n$restart_waybar" | rofi_cmd
}

show_install() {
    MANAGER=$(echo -e "󰏖 Pacman\n󰣇 Paru" | rofi -dmenu -i -p -theme ${dir}/${theme}.rasi "Update with")

    case "$MANAGER" in
            *"Pacman")
                $TERMINAL -e bash -c "$HOME/.config/hypr/scripts/install.sh"
                ;;
            *"Paru")
                $TERMINAL -e bash -c "$HOME/.config/hypr/scripts/paruinstall.sh"
                ;;
    esac
}

show_addremove() {
    MANAGER=$(echo -e "Install\nRemove" | rofi -dmenu -i -p -theme ${dir}/${theme}.rasi "App")

    case "$MANAGER" in
            *"Install")
            show_install
            ;;
            *"Remove")
            $TERMINAL -e "$HOME/.config/hypr/scripts/remove.sh"
            ;;
    esac
}

show_tui() {
    ~/.config/rofi/system/tui.sh
}
show_gamemode() {
    ~/.config/rofi/gamemode/gamemode.sh
}
show_monitors() {
    ~/.config/rofi/monitor_sel/monitor_sel.sh
}
show_update() {
    MANAGER=$(echo -e "󰏖 Pacman\n󰣇 Paru\n󰚰 All Packages (Pacman & Paru)" | rofi -dmenu -i -p -theme ${dir}/${theme}.rasi "Update with")

    case "$MANAGER" in
        *"All Packages"*)
            $TERMINAL -e bash -c "echo 'Updating all packages...sudo pacman -Syu, paru -Sua'; paru -Syu; echo 'Update complete!'; read -p 'Press enter to close...'"
            ;;
        *"Pacman")
            $TERMINAL -e bash -c "echo sudo pacman -Syu; sudo pacman -Syu; read -p 'Press enter to close...'"
            ;;
        *"Paru")
            $TERMINAL -e bash -c "echo paru -Sua; paru -Sua; read -p 'Press enter to close...'"
            ;;
    esac
}

# Execute Command
run_cmd() {
	echo "$selected"
	    if [[ $1 == '--monitors' ]]; then
			show_monitors
        elif [[ $1 == '--gamemode' ]]; then
            show_gamemode
		# elif [[ $1 == '--all' ]]; then
  #          hyprctl keyword monitor DP-3,1920x1080@144.00,0x0,1
  #          hyprctl keyword monitor HDMI-A-1,848x480@60,4480x0,1
  #          notify-send "ALL MONITORS"
       elif [[ $1 == '--restart_waybar' ]]; then
           killall waybar && hyprctl dispatch exec waybar
           notify-send "Waybar Restarted"
       elif [[ $1 == '--addremove' ]]; then
           show_addremove
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
    $monitors)
    run_cmd --monitors
    ;;
    $gamemode)
    run_cmd --gamemode
    ;;
    $restart_waybar)
    run_cmd --restart_waybar
    ;;
    $addremove)
    run_cmd --addremove
    ;;
    $update)
    run_cmd --update
    ;;
    $tui)
    show_tui
    ;;
esac
