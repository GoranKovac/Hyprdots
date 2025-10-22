journalctl -b | fzf --sync --border --border-label=" JOURNALCTL BOOT " \
--header 'CTRL-B: Last Boot, CTRL-T: Today, CTRL-F: Follow' \
--bind 'ctrl-t:reload(journalctl --since="today")+change-border-label( JOURNALCTL TODAY )+top' \
--bind 'ctrl-b:reload(journalctl -b)+change-border-label( JOURNALCTL BOOT )+top' \
--bind 'ctrl-f:reload(journalctl -f)+change-border-label( JOURNALCTL FOLLOW )+top'
