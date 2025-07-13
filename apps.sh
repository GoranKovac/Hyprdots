#!/bin/bash

pkgs=(
    steam
    zed
    zls
    godot
    blender
    reaper
    reapack
    yazi
)

sudo pacman -S "${pkgs[@]}"
