# guard clause against non-interactive sessions
[[ $- != *i* ]] && return

# the get the start time in terms of nanosecs
STARTUP_TIME=$(date +%s%N)

_cmd_exists() { command -v "$1" &> /dev/null; }
_lazy_load() {
    local cmd_name="$1"
    local init_cmd="$2"

    # unset the load fn first, then init the cmd and run it with given args
    eval "$cmd_name() {
        unset -f $cmd_name; eval \"\$($init_cmd)\"; $cmd_name \"\$@\"
    }"
}


shopt -s autocd  # auto cd when entering dirname
shopt -s cdspell  # autocorrect path name
shopt -s histappend
shopt -s no_empty_cmd_completion

HISTFILE=~/.local/share/bash/.bash_history
HISTCONTROL='ignoredups'
HISTFILESIZE=100000


# quick command to commit to the bare repo tracking this configuration setup
alias dot='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
# bind bash completion for git to dot
if declare -F _completion_loader >/dev/null 2>&1; then
    _completion_loader git
    complete -o default -o nospace -F __git_wrap__git_main dot
fi


# configurations and utilities
. ~/.config/bash/aliases.sh
. ~/.config/bash/functions.sh
. ~/.config/bash/prompt.sh  # ps1 and 2 prompt, some other stuff too
. ~/.config/bash/gpg-agent.sh


[[ -f ~/.config/.dircolors ]] && eval $(dircolors ~/.config/.dircolors)

# cache directory for some eval commands
CACHE_DIR="$HOME/.local/share/bash/eval_cache"
mkdir -p "$CACHE_DIR"

if _cmd_exists fzf; then
    [[ ! -f "$CACHE_DIR/fzf.sh" ]] && fzf --bash > "$CACHE_DIR/fzf.sh"
    . "$CACHE_DIR/fzf.sh"
fi

_cmd_exists zoxide && _lazy_load go "zoxide init bash --cmd go"


# only call fastfetch if not in nvim
if [[ -z $ZELLIJ && -z $NVIM ]] && _cmd_exists fastfetch; then
    export STARTUP_TIME=$(( ($(date +%s%N) - $STARTUP_TIME) / 1000000 ))
    fastfetch -c ~/.config/fastfetch/config.jsonc
    unset STARTUP_TIME
fi

unset -f _cmd_exists
unset -f _lazy_load
