#!/usr/bin/env bash

current_vcp=$(ddcutil getvcp 10 --terse | cut -d' ' -f4)
step="${2:-10}"

if [ "$1" == "up" ]; then
    new_val=$((current_vcp + step))
elif [ "$1" == "down" ]; then
    new_val=$((current_vcp - step))
    [ $new_val -lt 10 ] && new_val=10
fi

ddcutil setvcp 10 $new_val &

notify-send -a "adjust-brightness" \
    -h string:x-canonical-private-synchronous:adjust_brightness \
    -h int:value:"$new_val" \
    "󰖨 $new_val%"
