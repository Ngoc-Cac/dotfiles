#!/usr/bin/env bash
# _cmd_exists is a utility function in .bashrc

### Listing Commands ###
# use eza instead of ls if available
_cmd_exists eza && alias ls="eza --icons=auto --group-directories-first --git -h"

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

### Git Commands ###
alias gs="git status"
alias gc="git commit"
alias gl="git ll"
alias gla="gl --all"

### External Packages ###
# Neovim
if _cmd_exists nvim; then
    alias vi="nvim"
    alias vim="nvim"
    alias nv="nvim"
fi

# Zellij
if _cmd_exists zellij; then
    alias zj="zellij"
    alias zja="zellij attach"
    alias zjl="zellij list-sessions"
fi

# Yazi
_cmd_exists yazi && alias zi="yazi"

# Opencode
if _cmd_exists opencode; then
    alias opc="opencode"
    alias opcls="opencode-ls"
fi

### Misc ###
[[ -n $SUDO_ASKPASS ]] && alias sudo="sudo -A"
alias cl="clear -x"
alias start="xdg-open"
alias ipython="python -m IPython"
alias pyi="python -m IPython --profile=ds"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
