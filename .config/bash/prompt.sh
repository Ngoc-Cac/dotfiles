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
_git_info() {
    local exit_code=$?

    # check for upstream repo, 2> redirects ONLY stderr to /dev/null
    local upstream=$(git rev-parse --abbrev-ref @{upstream} 2>/dev/null)
    [[ -z "$upstream" ]] && return $exit_code

    local ahead=$(git rev-list --count ${upstream}..HEAD 2>/dev/null)
    local behind=$(git rev-list --count HEAD..${upstream} 2>/dev/null)

    local counts=""
    [[ "$behind" -gt 0 ]] && counts="$YELLOW↓$behind "
    [[ "$ahead" -gt 0 ]] && counts+="$BGREEN↑$ahead"

    printf "\033[0;1m$RESET $(__git_ps1 "$MAGENTA%s$BOLD") $counts$RESET"

    return $exit_code
}


# if not set, conda will throw error because it can't
# parse the ps1 command 
export PYTHONIOENCODING=utf-8

PS1="[$BLUE\u@\h$RESET] $BYELLOW󰉋 \w \$(_git_info)"
PS1+="\012\$(_exit_code_info) ~#@❯$RESET  "

PS2="  󱞪 "
