#!/bin/bash
foot -a NVIM nvim "$@" </dev/null &>/dev/null &
hyprctl dispatch togglespecialworkspace "TERM" >/dev/null
if [ $(hyprctl activeworkspace -j | jq '.id') != 4 ]; then
    hyprctl dispatch workspace 4
fi
