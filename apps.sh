#!/bin/bash

pkgs=(
    zed
    zig
    zls
    reaper
    reapack
)

sudo pacman -S "${pkgs[@]}"
