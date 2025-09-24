#!/bin/bash

pkgs=(
    godot
    blender
    reaper
    reapack
    # deluxe paint
    grafx2

)

parupkgs=(
    material-maker-bin
    aseprite
    armorpaint
    blockbench-bin
    ldtk-bin
    pixi-editor
)

sudo pacman -S "${pkgs[@]}"
sudo paru -S "${parupkgs[@]}"
