#!/bin/bash
# for making symlinks ON WINDOWS
[[ "$OSTYPE" =~ ^(msys|cygwin) ]] && alias mklink="cmd //c mklink"

### Listing Commands ###
# use eza instead of ls if available
command -v eza > /dev/null && alias ls="eza --icons=auto --group-directories-first -h"

alias ll="ls -l"
alias la="ls -Al"
alias lh="ls -ld .?*"

# list declared aliases and functions
alias aliases="alias | sed 's/=.*//'"
alias functions="declare -f | grep '^[a-z].* ()' | sed 's/{$//'"

### File Modification ###
# i to confirm before overwriting
alias mv="mv -vi"
alias cp="cp -vi"

# verbose by default cause I'm anxious
alias rm="rm -v"
alias rv="rm"

### Git Commands ###
alias gs="git status"
alias gl="git log --graph --oneline"
alias gla="gl --all"

### Misc ###
alias cl="clear"
alias nv="nvim"
alias vi="nvim"
alias vim="nvim"
alias conda_act="source ~/miniconda3/Scripts/activate"

alias ..="cd .."
alias ...="cd ../.."
