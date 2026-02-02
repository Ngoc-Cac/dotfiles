# the get the start time in terms of nanosecs
STARTUP_TIME=$(date +%s%N)

_cmd_exists() { command -v "$1" > /dev/null; }
_lazy_load() {
    local cmd_name="$1"
    local init_cmd="$2"

    # unset the load fn first, then init the cmd
    # and run it with given args 
    eval "$cmd_name() {
        unset -f $cmd_name
        eval \"\$($init_cmd)\"
        $cmd_name \"\$@\"
    }"
}

# auto cd when entering dirname
shopt -s autocd

export GIT_EDITOR=nvim
export CDPATH='/d/!Projects:/d/!Projects/!Work'
export HISTFILE=~/logs/bash/.bash_history

# quick command to commit to the bare repo tracking this configuration setup
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias dotadd='dotfiles add'
alias dotcom='dotfiles commit'


# configurations and utilities
. ~/.config/bash/aliases.sh
. ~/.config/bash/functions.sh
. ~/.config/bash/prompt.sh  # ps1 and 2 prompt


[[ -f ~/.config/.dircolors ]] && eval $(dircolors ~/.config/.dircolors)

# wizardry lazy loading, for fzf, this means no c-r and alt-c tho 
_cmd_exists fzf &&\
    _lazy_load __fzf_select__ "fzf --bash" &&\
    bind -x '"\C-t": __fzf_select__ '
_cmd_exists zoxide &&\
    _lazy_load go "zoxide init bash --cmd go"


# only call fastfetch if not in nvim
if [[ -z "$NVIM" ]] && _cmd_exists fastfetch; then
    export STARTUP_TIME=$(( ($(date +%s%N) - $STARTUP_TIME) / 1000000 ))
    fastfetch -c ~/.config/fastfetch/config.jsonc
    unset STARTUP_TIME
fi

unset -f _cmd_exists
unset -f _lazy_load
