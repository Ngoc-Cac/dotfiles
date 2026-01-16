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

# quick command to commit to the bare repo tracking this configuration setup
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'


# configurations and utilities
source ~/.config/bash/env.sh
source ~/.config/bash/aliases.sh
source ~/.config/bash/functions.sh
source ~/.config/bash/prompt.sh  # ps1 prompt


# load these in the background 
[[ -f ~/.config/.dircolors ]] && eval $(dircolors ~/.config/.dircolors) &

_cmd_exists zoxide && _lazy_load go "zoxide init bash --cmd go"
_cmd_exists fzf && load_fzf() { eval "$(fzf --bash)"; }


# only call fastfetch if not in nvim
if _cmd_exists fastfetch && [[ -z "$NVIM" ]]; then
    export STARTUP_TIME=$(( ($(date +%s%N) - $STARTUP_TIME) / 1000000 ))
    fastfetch -c ~/.config/fastfetch/config.jsonc
    unset STARTUP_TIME
fi

unset -f _cmd_exists
