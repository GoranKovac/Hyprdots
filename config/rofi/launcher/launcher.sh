#!/bin/bash

dir="$HOME/.config/rofi/launcher/"
theme='style'

#gameworkspace=10
#activeworkspace=$(hyprctl activeworkspace -j | jq '.id' | grep "$gameworkspace")

## Run
# if [ "$activeworkspace" == "" ]; then
pgrep rofi >/dev/null 2>&1 && killall rofi || \
rofi \
    -show drun -no-history -no-config -matching prefix -drun-match-fields name -no-tokenize\
    -theme ${dir}/${theme}.rasi
# fi
