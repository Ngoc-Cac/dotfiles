#!/usr/bin/env bash
. /usr/share/git/completion/git-prompt.sh

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
PS1+="\[$MAGENTA\]\$_PS1_GIT\[$RESET\]"
PS1+=$'\n'"\$_EXIT_CODE_SYMBOL\[$RESET\]  "

PS2="  󱞪 "


# Zellij shell integration stuff: https://zellij.dev/documentation/shell-integration.html
if [[ -n "$ZELLIJ" ]]; then
    # prompt start + PS1 + prompt end
    PS1="\[\033]133;A\033\\\\\]${PS1}\[\033]133;B\033\\\\\]"

    # ran after a command is read, but before execution
    PS0='\033]133;C\033\\'  # starts of command output

    # ends of command + exit status
    __zellij_osc133_precmd() {
        local exit=$?
        printf '\033]133;D;%s\033\\' "$exit"
        return "$exit"
    }
    PROMPT_COMMAND="__zellij_osc133_precmd; $PROMPT_COMMAND"
fi
