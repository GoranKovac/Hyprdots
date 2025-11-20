#!/bin/bash

cliphist list | fuzzel -w 60 -d -i -p "Clipboard: " | cliphist decode | wl-copy
