#!/bin/bash

pkgs=(
    godot
    blender
    reaper
    reapack
    # deluxe paint
    grafx2
    krita
)

parupkgs=(
    material-maker-bin
    aseprite
    armorpaint
    blockbench-bin
    ldtk-bin
    pixi-editor
    davinci-resolve
)

sudo pacman -S "${pkgs[@]}"
paru -S "${parupkgs[@]}"
