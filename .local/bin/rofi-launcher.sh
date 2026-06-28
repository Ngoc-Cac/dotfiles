#!/usr/bin/env bash

rofi -show drun \
    -run-command 'uwsm app -- {cmd}' \
    -drun-command 'uwsm app -- {cmd}' \
    -theme ~/.config/rofi/launcher.rasi
