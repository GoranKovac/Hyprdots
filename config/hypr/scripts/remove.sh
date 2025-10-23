pacmanremove () {
    #pacman -Qqe | fzf --multi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns
    pacman -Qqe | fzf --border-label=" REMOVE PACKAGES " --border --multi --preview 'Items> ' \
    --header 'CTRL-F: Toggle Selected LIST, [TAB]: multi-select' \
    --preview-label ' Package INFO ' \
    --preview 'pacman -Qi {1}' \
    --bind 'ctrl-f:transform:[[ $(</tmp/state) -eq 0 ]] &&
    echo "execute-silent(echo 1 > /tmp/state)+change-preview-label( Selected Packages )+change-preview:cat \{+f}" ||
    echo "execute-silent(echo 0 > /tmp/state)+change-preview-label( Package )+change-preview:pacman -Qi \{1}"' \
    | xargs -tro sudo pacman -Rns
}
pacmanremove
