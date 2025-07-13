#!/usr/bin/env sh
hyprctl activeworkspace -j | jq '.id' | grep 10 || $menu
