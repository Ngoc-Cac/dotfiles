# the get the start time in terms of nanosecs
bash_start=$(date +%s%N)

_cmd_exists() { command -v "$1" > /dev/null; }


# auto cd when entering dirname
shopt -s autocd

# quick command to commit to the bare repo tracking this configuration setup
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'


# configurations and utilities
source ~/.config/bash/env.sh
source ~/.config/bash/aliases.sh
source ~/.config/bash/functions.sh


_cmd_exists fzf && eval "$(fzf --bash)"
_cmd_exists zoxide && eval "$(zoxide init bash --cmd go)"

# prompt
# _cmd_exists oh-my-posh && eval "$(oh-my-posh init bash --config slimfat)"
source ~/.config/bash/prompt.sh


if _cmd_exists fastfetch; then
    export STARTUP_TIME=$(( ($(date +%s%N) - $bash_start) / 1000000 ))
    fastfetch -c ~/.config/fastfetch/config.jsonc
    unset bash_start
    unset STARTUP_TIME
fi

unset -f _cmd_exists
