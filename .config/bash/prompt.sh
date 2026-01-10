#!/bin/bash

_exit_code_info() { [[ $? -eq 0 ]] && printf "\033[32m" || printf "\033[31m󰬅"; }
_git_info() {
    local exit_code=$?

    # check for upstream repo, 2> redirects ONLY stderr to /dev/null
    local upstream=$(git rev-parse --abbrev-ref @{upstream} 2>/dev/null)
    [[ -z "$upstream" ]] && return $exit_code

    local ahead=$(git rev-list --count ${upstream}..HEAD 2>/dev/null)
    local behind=$(git rev-list --count HEAD..${upstream} 2>/dev/null)

    local counts=""
    [[ "$behind" -gt 0 ]] && counts="\033[91m↓$behind "
    [[ "$ahead" -gt 0 ]] && counts="$counts\033[92m↑$ahead"

    local branch=$(__git_ps1 "\033[35m%s") 
    printf "($branch $counts)"

    return $exit_code
}
_conda_info() {
    local exit_code=$?

    [[ -n "$CONDA_DEFAULT_ENV" ]] && printf "(%s) " "$CONDA_DEFAULT_ENV"

    return $exit_code
}


# if not set, conda will throw error because it can't
# parse the ps1 command 
export PYTHONIOENCODING=utf-8

PS1='$(_conda_info)\033[34m\u@\h \033[93m󰉋 \w \033[0m$(_git_info)'
PS1+='\012$(_exit_code_info) ~#@❯\033[0m  '
