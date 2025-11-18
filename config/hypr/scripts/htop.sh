#!/bin/bash
pgrep htop >/dev/null 2>&1 && killall htop || kitty --class=SYS htop
