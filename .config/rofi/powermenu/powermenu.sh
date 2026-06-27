#!/usr/bin/env bash
theme="$HOME/.config/rofi/powermenu/style.rasi"

shutdown='  Shutdown'
reboot='  Reboot'
suspend='󰤄  Suspend'
logout='󰗽  Logout'
yes='Yes'
no='No'


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

run_cmd() {
    [[ "$(confirm_dialogue)" == "$no" ]] && exit 0

    if [[ $1 == '--shutdown' ]]; then
        systemctl poweroff
    elif [[ $1 == '--reboot' ]]; then
        systemctl reboot
    elif [[ $1 == '--suspend' ]]; then
        systemctl suspend
    elif [[ $1 == '--logout' ]]; then
        session_logout
    fi
}

case $(select_dialogue) in
    $shutdown)
		run_cmd --shutdown
        ;;
    $reboot)
		run_cmd --reboot
        ;;
    $suspend)
		run_cmd --suspend
        ;;
    $logout)
		run_cmd --logout
        ;;
esac
