#!/usr/bin/env bash

dir="$HOME/.config/rofi/run/"
theme='style'

## Run
rofi \
    -show run \
    -theme ${dir}/${theme}.rasi
