#!/bin/bash

TERMINAL='foot -a SYS'

apps='󰀻 Apps'
install='󰏔 Install'
remove='󰆴 Remove'
sysupdate='󰚰 System Update'
tools='󱂬 TUI Tools'
find='󰍉 Find'
gamemode='  HyperGameMode'
monitor_sel='  Monitor Select'
waybar_reset='  Waybar Restart'
turnoff=' PowerOff'

# Rofi CMD
rofi_cmd() {
    fuzzel --dmenu -p "Main Menu > "
}

# Pass variables to rofi dmenu
run_rofi() {
    echo -e "$apps\n$install\n$remove\n$find\n$sysupdate\n$tools\n$gamemode\n$monitor_sel\n$waybar_reset\n$turnoff" | rofi_cmd
}

# Execute Command
run_cmd() {
    if [[ $1 == '--install' ]]; then
        show_install
    elif [[ $1 == '--remove' ]]; then
        $TERMINAL -e "$HOME/.config/hypr/scripts/remove.sh"
    elif [[ $1 == '--update' ]]; then
        show_update
    elif [[ $1 == '--tools' ]]; then
        show_tui
    elif [[ $1 == '--apps' ]]; then
        show_apps
    elif [[ $1 == '--find' ]]; then
        show_find
    elif [[ $1 == '--gamemode' ]]; then
        show_gamemode
    elif [[ $1 == '--monitor_sel' ]]; then
        show_monitor_sel
    elif [[ $1 == '--poweroff' ]]; then
        show_poweroff
    fi
}

show_apps() {
    ~/.config/fuzzel/scripts/launcher.sh
}

show_find() {
    ~/.config/fuzzel/scripts/locate.sh
}

show_gamemode() {
    ~/.config/fuzzel/scripts/gamemode.sh
}

show_monitor_sel() {
    ~/.config/fuzzel/scripts/monitor_sel.sh
}

show_poweroff() {
    ~/.config/fuzzel/scripts/powermenu.sh
}

show_tui() {
    ~/.config/fuzzel/scripts/tui.sh
}

# Update menu - ENHANCED
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

# Actions
chosen="$(run_rofi)"
case ${chosen} in
$apps)
    run_cmd --apps
    ;;
$install)
    run_cmd --install
    ;;
$find)
    run_cmd --find
    ;;
$remove)
    run_cmd --remove
    ;;
$sysupdate)
    run_cmd --update
    ;;
$tools)
    run_cmd --tools
    ;;
$gamemode)
    run_cmd --gamemode
    ;;
$monitor_sel)
    run_cmd --monitor_sel
    ;;
$waybar_reset)
    killall waybar && hyprctl dispatch exec waybar
    ;;
$turnoff)
    run_cmd --poweroff
    ;;
esac
