#!/bin/bash

# Current Theme
dir="$HOME/.config/rofi/system"
theme='style'

# CMDs
uptime="`uptime -p | sed -e 's/up //g' | sed -e 's/hour/hr/g' | sed -e 's/minute/min/g'`"

TERMINAL="kitty"

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
	rofi -dmenu \
		-p " $USER" \
		-mesg " Uptime: $uptime" \
		-theme ${dir}/${theme}.rasi
}

# Pass variables to rofi dmenu
run_rofi() {
    echo -e "$apps\n$install\n$remove\n$find\n$sysupdate\n$tools\n$gamemode\n$monitor_sel\n$waybar_reset\n$turnoff" | rofi_cmd
}

# Execute Command
run_cmd() {
	if [[ $1 == '--install' ]]; then
	show_install
	    # kitty -e "$HOME/.config/hypr/scripts/install.sh"
	elif [[ $1 == '--remove' ]]; then
        kitty -e "$HOME/.config/hypr/scripts/remove.sh"
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
    ~/.config/rofi/launcher/launcher.sh
}

show_find() {
    ~/.config/rofi/locate/rofi-locate.sh
}

show_gamemode() {
    ~/.config/rofi/gamemode/gamemode.sh
}

show_monitor_sel() {
    ~/.config/rofi/monitor_sel/monitor_sel.sh
}

show_poweroff() {
    ~/.config/rofi/powermenu/powermenu.sh
}

show_tui() {
    # TUI_APP=$(echo -e "󰒍 YAZI (File Manager)\n󰅬 NCDU (Disk Usage Analyzer)\n󰒋 HTOP (Process Viewer)\n󰙨 IFTOP (Network Bandwidth)" | rofi -dmenu -i -p -theme ${dir}/${theme}.rasi "TUI Apps")
    TUI_APP=$(echo -e "󰒋 HTOP (Process Viewer)\n󰙨 IFTOP (Network Bandwidth)\n NVTOP (GPU)\n󰅬 NCDU (Disk Usage Analyzer)\n󰒍 YAZI (File Manager)\n󰒍 SYSTEMCTL (Systemd services)" | rofi -dmenu -i -p -theme ${dir}/${theme}.rasi "TUI Apps")

    case "$TUI_APP" in
        *"HTOP"*)
            if command -v htop >/dev/null 2>&1; then
                $TERMINAL -e htop
            else
                notify-send "TUI Apps" "htop not installed\nInstall: sudo pacman -S htop"
            fi
            ;;
        *"IFTOP"*)
            if command -v iftop >/dev/null 2>&1; then
                $TERMINAL -e bash -c "echo sudo iftop; sudo iftop"
            else
                notify-send "TUI Apps" "iftop not installed\nInstall: sudo pacman -S iftop"
            fi
            ;;
        *"NVTOP"*)
               if command -v nvtop >/dev/null 2>&1; then
                   $TERMINAL -e nvtop
               else
                   notify-send "TUI Apps" "nvtop not installed\nInstall: sudo pacman -S nvtop"
               fi
               ;;
         *"NCDU"*)
            if command -v ncdu >/dev/null 2>&1; then
                $TERMINAL -e ncdu
            else
                notify-send "TUI Apps" "ncdu not installed\nInstall: sudo pacman -S ncdu"
            fi
            ;;
        *"YAZI"*)
                if command -v yazi >/dev/null 2>&1; then
                    $TERMINAL -e yazi
                else
                    notify-send "TUI Apps" "yazi not installed\nInstall: yay -S yazi"
                fi
                ;;
        *"SYSTEMCTL"*)
            if command -v systemctl-tui >/dev/null 2>&1; then
                $TERMINAL -e systemctl-tui
            else
                notify-send "TUI Apps" "systemctl-tui not installed\nInstall: suro pacman -S systemctl-tui"
            fi
            ;;
    esac
}
# Update menu - ENHANCED
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
