#!/bin/bash

targetwindow=$(hyprctl activewindow -j | jq '.class' | grep "REAPER")
activewindow=$(hyprctl activewindow -j | jq -r .address)

#Limit refocus hack only to Reaper windows
if [[ ! -z $targetwindow ]]; then
    #move focus to main reaper
    hyprctl dispatch focuswindow 'title:.*(REAPER).*'
    #return focus to plugin
    hyprctl dispatch focuswindow address:"$activewindow"
fi
