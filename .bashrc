# the get the start time in terms of nanosecs
STARTUP_TIME=$(date +%s%N)

_cmd_exists() { command -v "$1" > /dev/null; }


# auto cd when entering dirname
shopt -s autocd

# quick command to commit to the bare repo tracking this configuration setup
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'


# configurations and utilities
source ~/.config/bash/env.sh
source ~/.config/bash/aliases.sh
source ~/.config/bash/functions.sh
source ~/.config/bash/prompt.sh  # ps1 prompt

[[ -f ~/.config/bash/.dircolors ]] && eval $(dircolors ~/.config/bash/.dircolors)

_cmd_exists fzf && eval "$(fzf --bash)"
_cmd_exists zoxide && eval "$(zoxide init bash --cmd go)"


# only call fastfetch if not in nvim
if _cmd_exists fastfetch && [[ -z "$NVIM" ]]; then
    export STARTUP_TIME=$(( ($(date +%s%N) - $STARTUP_TIME) / 1000000 ))
    fastfetch -c ~/.config/fastfetch/config.jsonc
    unset STARTUP_TIME
fi

unset -f _cmd_exists
