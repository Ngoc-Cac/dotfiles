#!/bin/bash
# for making symlinks ON WINDOWS
alias mklink="cmd //c mklink"
alias vim="nvim"

if command -v eza > /dev/null; then
    alias ls="eza --icons=always --group-directories-first -h"
fi
alias ll="ls -l"
alias la="ls -Al"
alias lh="ls -ld .?*"

# verbose by default cause I'm anxious
alias rm="rm -v"
alias rv="rm"

# list declared aliases and functions
alias aliases="alias | sed 's/=.*//'"
alias functions="declare -f | grep '^[a-z].* ()' | sed 's/{$//'"

# quick git commands
alias gs="git status"
alias gl="git log --graph --oneline"
alias gla="gl --all"

alias conda_act="source ~/miniconda3/Scripts/activate"
