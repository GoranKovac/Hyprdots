#!/bin/bash
#             _   _     _      _
#  __ _  ___ | |_| |__ | | ___| |_ _   _
# / _` |/ _ \| __| '_ \| |/ _ \ __| | | |
#| (_| | (_) | |_| |_) | |  __/ |_| |_| |
# \__, |\___/ \__|_.__/|_|\___|\__|\__,_|
# |___/
#       https://www.youtube.com/user/gotbletu
#       https://twitter.com/gotbletu
#       https://plus.google.com/+gotbletu
#       https://github.com/gotbletu
#       gotbletu@gmail.com

# info: rofi-locate is a script to search local files and folders on your computer using the locate command and the updatedb database
# requirements: rofi mlocate
# playlist: rofi      https://www.youtube.com/playlist?list=PLqv94xWU9zZ0LVP1SEFQsLEYjZC_SUB3m

dir="$HOME/.config/rofi/locate/"
theme='style'
#read -rsn1 input
#notify-send `"$input"`
#xdg-open "$(locate / | rofi -threads 0 -width 100 -dmenu -i -p "locate:")"

#locate / | rofi -use-hot-keys -threads 0 -width 100 -dmenu -i -p -theme ${dir}/${theme}.rasi "locate" | xargs -r xdg-open

fd --type f . / -H -u | rofi -width 100 -dmenu -i -p FILES -theme ${dir}/${theme}.rasi | sed "s/^/'/;s/$/'/" | xargs -r nautilus #xdg-open

# fd --type f pdf . $HOME | rofi -keep-right -dmenu -i -p FILES -multi-select | xargs -I {} xdg-open {}
