#!/bin/bash

fd --type f . / -H -u | fuzzel -w 100 -d -I | sed "s/^/'/;s/$/'/" | xargs -r nautilus
