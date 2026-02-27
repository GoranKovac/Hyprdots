#!/bin/bash

TERMINAL='foot -a SYS'

# CMDs
monitors='󰍺 Monitors'
gamemode='󰊗 GameMode'
# gamemode_off='GameMode Off'
restart_waybar='󱄌 Restart Waybar'
# all='All Monitors'
# install='Install'
# remove='Remove'
update='󰚰 Update System'
tui='󱂬 TUI Tools'
addremove='󰏔 Install/Remove App'
config=' Config'
# roli='Connect Roli BT'

# Rofi CMD
rofi_cmd() {
    fuzzel --dmenu -p "QuickTools > "
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
    echo -e "$monitors\n$gamemode\n$addremove\n$update\n$tui\n$config\n$restart_waybar" | rofi_cmd
}

show_install() {
    MANAGER=$(echo -e "󰏖 Pacman\n󰣇 Paru" | fuzzel --dmenu -i -p "Update with")

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
    MANAGER=$(echo -e "Install\nRemove" | fuzzel --dmenu -i -p "App")

    case "$MANAGER" in
    *"Install")
        show_install
        ;;
    *"Remove")
        $TERMINAL -e bash -c "$HOME/.config/hypr/scripts/remove.sh; read -p 'Press enter to close...'"
        ;;
    esac
}

show_tui() {
    ~/.config/fuzzel/scripts/tui.sh
}
show_config() {
    ~/.config/fuzzel/scripts/config.sh
}
show_gamemode() {
    ~/.config/fuzzel/scripts/gamemode.sh
}
show_monitors() {
    ~/.config/fuzzel/scripts/monitor_sel.sh
}
show_update() {
    MANAGER=$(echo -e "󰏖 Pacman\n󰣇 Paru\n󰚰 All Packages (Pacman & Paru)" | fuzzel --dmenu -i -p "Update with ")

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
$config)
    show_config
    ;;
esac
