#!/bin/bash

pkgs=(
    bluez
    bluez-utils
)

sudo pacman -S "${pkgs[@]}"

systemctl start bluetooth
systemctl enable bluetooth

bluetoothctl trust 48:B6:20:0A:5A:59
bluetoothctl disconnect 48:B6:20:0A:5A:59
bluetoothctl connect 48:B6:20:0A:5A:59
