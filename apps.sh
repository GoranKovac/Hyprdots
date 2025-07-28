#!/bin/bash

pkgs=(
    steam
    zed
    zls
    godot
    blender
    reaper
    reapack
)

sudo pacman -S "${pkgs[@]}"
