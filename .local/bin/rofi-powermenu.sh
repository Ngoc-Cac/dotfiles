#!/usr/bin/env bash

theme="~/.config/rofi/powermenu.rasi"
shutdown='  Shutdown'
reboot='  Reboot'
suspend='󰤄  Suspend'
logout='󰗽  Logout'
yes='Yes'
no='No'


session_logout() {
    if [[ "$DESKTOP_SESSION" == 'hyprland-uwsm' ]]; then
        uwsm stop
    elif [[ "$DESKTOP_SESSION" == 'hyprland' ]]; then
        command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit
    else
        notify-send -a "Rofi Power Menu" "Cannot logout!" \
            "Undetermined session $DESKTOP_SESSION. Please implement it!"
    fi
}

confirm_dialogue() {
	echo -e "$yes\n$no" | rofi \
        -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 250px;}' \
		-theme-str 'mainbox {children: [ "message", "listview" ];}' \
		-theme-str 'listview {columns: 2; lines: 1;}' \
		-theme-str 'element-text {horizontal-align: 0.5;}' \
		-theme-str 'textbox {horizontal-align: 0.5;}' \
		-dmenu \
		-p 'Confirmation' \
		-mesg 'Are you Sure?' \
		-theme ${theme}
}

select_dialogue() {
	echo -e "$shutdown\n$reboot\n$suspend\n$logout" | rofi -dmenu -i -theme ${theme}
}


case $(select_dialogue) in
    $shutdown)
        [[ "$(confirm_dialogue)" == "$yes" ]] && systemctl poweroff
        ;;
    $reboot)
        [[ "$(confirm_dialogue)" == "$yes" ]] && systemctl reboot
        ;;
    $suspend)
        systemctl suspend
        ;;
    $logout)
        session_logout
        ;;
esac
