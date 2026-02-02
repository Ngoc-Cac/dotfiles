#!/usr/bin/env bash

BLUE="\033[34m"
BGREEN="\033[92m"
GREEN="\033[32m"
MAGENTA="\033[35m"
RED="\033[31m"
BYELLOW="\033[93m"
YELLOW="\033[33m"

RESET="\033[0m"
BOLD="\033[1m"

_exit_code_info() { [[ $? -eq 0 ]] && printf "$GREEN" || printf "$RED"; }

# if not set, conda will throw error because it can't
# parse the ps1 command 
export PYTHONIOENCODING=utf-8
export GIT_PS1_SHOWUPSTREAM="verbose"
export GIT_PS1_SHOWCOLORHINTS=true

PROMPT_COMMAND='_PS1_GIT=$(__git_ps1 "%s")'

PS1="[\[$BLUE\]\u@\h\[$RESET\]] \[$BYELLOW\]󰉋 \w "
PS1+="\[$MAGENTA\]\$_PS1_GIT"
PS1+=$'\n'"\$(_exit_code_info) ~#@❯\[$RESET\]  "

PS2="  󱞪 "
