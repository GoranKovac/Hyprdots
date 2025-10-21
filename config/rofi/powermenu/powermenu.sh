#!/bin/bash

# Current Theme
dir="$HOME/.config/rofi/powermenu/"
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
poweroff='Poweroff'
reboot='Reboot'
bios='Bios'
# suspend='Suspend'
logout='Logout'

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p " $USER" \
		-mesg " Uptime: $uptime" \
		-theme ${dir}/${theme}.rasi
}

# Pass variables to rofi dmenu
run_rofi() {
    echo -e "$poweroff\n$reboot\n$logout\n$bios" | rofi_cmd
}

# Execute Command
run_cmd() {
	if [[ $1 == '--poweroff' ]]; then
		systemctl poweroff
	elif [[ $1 == '--reboot' ]]; then
		systemctl reboot
	elif [[ $1 == '--logout' ]]; then
	    loginctl kill-user $(whoami)
	elif [[ $1 == '--bios' ]]; then
    	systemctl reboot --firmware-setup
	fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $poweroff)
		run_cmd --poweroff
        ;;
    $reboot)
		run_cmd --reboot
        ;;
    $logout)
		run_cmd --logout
        ;;
    $bios)
		run_cmd --bios
        ;;
esac
