#!/bin/bash
pgrep wiremix >/dev/null 2>&1 && killall wiremix || kitty --class=WIREMIX wiremix
