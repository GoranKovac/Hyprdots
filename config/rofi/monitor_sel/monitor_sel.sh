#!/usr/bin/env bash

# Current Theme
dir="$HOME/.config/rofi/monitor_sel/"
theme='style'

# CMDs
uptime="`uptime -p | sed -e 's/up //g' | sed -e 's/hour/hr/g' | sed -e 's/minute/min/g'`"

# # Options
primary='Primary'
all='All'

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p " $USER" \
		-mesg " Uptime: $uptime" \
		-theme ${dir}/${theme}.rasi
}

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
		elif [[ $1 == '--all' ]]; then
            hyprctl keyword monitor DP-3,1920x1080@144.00,0x0,auto
            hyprctl keyword monitor HDMI-A-1,848x480@60,4480x0,auto
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
