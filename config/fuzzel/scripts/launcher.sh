#!/bin/bash

## Run
pgrep fuzzel >/dev/null 2>&1 && killall fuzzel ||
    fuzzel
[-d | --dmenu]
