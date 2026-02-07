#!/usr/bin/env bash

BLUE="\033[34m"
GREEN="\033[32m"
MAGENTA="\033[35m"
RED="\033[31m"
YELLOW="\033[33m"
GRAY="\033[90m"

RESET="\033[0m"

# \001 and \002 is equivalent to \[ \]
_exit_code_info() { [[ $? -eq 0 ]] && printf "\001$GREEN\002" || printf "\001$RED\002"; }

# if not set, conda will throw error because it can't
# parse the ps1 command 
export PYTHONIOENCODING=utf-8
export GIT_PS1_SHOWUPSTREAM="verbose"
export GIT_PS1_SHOWCOLORHINTS=1
# export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWCONFLICTSTATE=yes

PROMPT_COMMAND='_PS1_GIT=$(__git_ps1 "%s"); _EXIT_CODE_SYMBOL=$(_exit_code_info)'

PS1="[\[$BLUE\]\u@\h\[$RESET\]] \[$YELLOW\]󰉋 \w "
PS1+="\[$MAGENTA\]\$_PS1_GIT"
PS1+=$'\n'"\$_EXIT_CODE_SYMBOL \[$GRAY\]~#@❯\[$RESET\]  "

PS2="  󱞪 "
