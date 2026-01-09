# the get the start time in terms of nanosecs
bash_start=$(date +%s%N)

_cmd_exists() { command -v "$1" > /dev/null; }

# quick command to commit to the bare repo tracking this configuration setup
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'


source ~/.config/bash/env.sh

source ~/.config/bash/aliases.sh

source ~/.config/bash/functions.sh


if _cmd_exists fzf; then eval "$(fzf --bash)"; fi

if _cmd_exists zoxide; then eval "$(zoxide init bash --cmd go)"; fi

if _cmd_exists oh-my-posh; then
    # eval "$(oh-my-posh init bash --config gruvbox)"
    eval "$(oh-my-posh init bash --config slimfat)"
fi


if _cmd_exists fastfetch; then
    export STARTUP_TIME=$(( ($(date +%s%N) - $bash_start) / 1000000 ))
    fastfetch -c ~/.config/fastfetch/config.jsonc
    unset STARTUP_TIME
fi

unset -f _cmd_exists
