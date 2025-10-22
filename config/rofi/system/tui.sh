#!/bin/bash
# Current Theme

dir="$HOME/.config/rofi/system"
theme='style'

TERMINAL='kitty --class=SYS'

show_journalctl() {
    # ~/.config/hypr/scripts/journalctlfzf.sh
    $TERMINAL -e "$HOME/.config/hypr/scripts/journalctlfzf.sh"
}
show_dmesg() {
     $TERMINAL -e bash -c "echo sudo dmesg; $HOME/.config/hypr/scripts/dmesgfzf.sh"
}

show_tui() {
    # TUI_APP=$(echo -e "󰒍 YAZI (File Manager)\n󰅬 NCDU (Disk Usage Analyzer)\n󰒋 HTOP (Process Viewer)\n󰙨 IFTOP (Network Bandwidth)" | rofi -dmenu -i -p -theme ${dir}/${theme}.rasi "TUI Apps")
    TUI_APP=$(echo -e "󰒋 HTOP (Process Viewer)\n󰙨 IFTOP (Network Bandwidth)\n NVTOP (GPU)\n󰅬 NCDU (Disk Usage Analyzer)\n󰒍 YAZI (File Manager)\n󰒍 SYSTEMCTL (Systemd services)\n JOURNALCTL (System log)\n DMESG (Boot log)" | rofi -dmenu -i -p -theme ${dir}/${theme}.rasi "TUI Apps")

    case "$TUI_APP" in
        *"HTOP"*)
        if command -v htop >/dev/null 2>&1; then
            $TERMINAL -e htop
        else
            notify-send "TUI Apps" "htop not installed\nInstall: sudo pacman -S htop"
        fi
        ;;
        *"IFTOP"*)
        if command -v iftop >/dev/null 2>&1; then
            $TERMINAL -e bash -c "echo sudo iftop; sudo iftop"
        else
            notify-send "TUI Apps" "iftop not installed\nInstall: sudo pacman -S iftop"
        fi
        ;;
        *"NVTOP"*)
        if command -v nvtop >/dev/null 2>&1; then
            $TERMINAL -e nvtop
        else
            notify-send "TUI Apps" "nvtop not installed\nInstall: sudo pacman -S nvtop"
        fi
        ;;
        *"NCDU"*)
        if command -v ncdu >/dev/null 2>&1; then
            $TERMINAL -e ncdu
        else
            notify-send "TUI Apps" "ncdu not installed\nInstall: sudo pacman -S ncdu"
        fi
        ;;
        *"YAZI"*)
        if command -v yazi >/dev/null 2>&1; then
            $TERMINAL -e yazi
        else
            notify-send "TUI Apps" "yazi not installed\nInstall: yay -S yazi"
        fi
        ;;
        *"SYSTEMCTL"*)
        if command -v systemctl-tui >/dev/null 2>&1; then
            $TERMINAL -e systemctl-tui
        else
            notify-send "TUI Apps" "systemctl-tui not installed\nInstall: suro pacman -S systemctl-tui"
        fi
        ;;
        *"JOURNALCTL"*)
        show_journalctl
        ;;
        *"DMESG"*)
        show_dmesg
        ;;
    esac
}
show_tui
