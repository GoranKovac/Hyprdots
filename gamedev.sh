#!/bin/bash

pkgs=(
    godot
    blender
    # reaper
    # reapack
    # deluxe paint
    grafx2
    krita
)

parupkgs=(
    material-maker-bin
    #aseprite #on steam
    armorpaint
    blockbench-bin
    #ldtk-bin
    #pixi-editor #on steam
    # davinci-resolve
)

sudo pacman -S "${pkgs[@]}"
paru -S "${parupkgs[@]}"
