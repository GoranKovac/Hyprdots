#!/bin/bash

dir="$HOME/.config/rofi/clipboard/"
theme='style'

cliphist list | rofi -dmenu -i -p "Clipboard:" \
-theme ${dir}/${theme}.rasi \
| cliphist decode | wl-copy
