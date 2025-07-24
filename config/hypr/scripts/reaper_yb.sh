#!/bin/bash

targetwindow=$(hyprctl activewindow -j | jq '.class' | grep "REAPER")
#Limit refocus hack only to Reaper windows
if [[ ! -z $targetwindow ]]; then
    activewindow=$(hyprctl activewindow -j | jq -r .address)
    pid=$(pidof reaper)
    #move focus to main reaper
    hyprctl dispatch focuswindow pid:"$pid"
    #return focus to plugin
    hyprctl dispatch focuswindow address:"$activewindow"
fi
