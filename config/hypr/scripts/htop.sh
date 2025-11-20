#!/bin/bash
pgrep htop >/dev/null 2>&1 && killall htop || foot -a SYS htop
