#!/bin/bash

pkgs=(
    zed
    zig
    zls
    godot
    blender
    reaper
    reapack
)

sudo pacman -S "${pkgs[@]}"
