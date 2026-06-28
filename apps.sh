#!/bin/bash

pkgs=(
    zig
    zls
    reaper
    reapack
)

sudo pacman -S "${pkgs[@]}"
