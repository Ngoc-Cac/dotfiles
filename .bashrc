# quick command to commit to the bare repo tracking this configuration setup
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

source ~/.config/bash/env.sh

source ~/.config/bash/aliases.sh

source ~/.config/bash/functions.sh

if command -v oh-my-posh > /dev/null; then
    # eval "$(oh-my-posh init bash --config gruvbox)"
    eval "$(oh-my-posh init bash --config slimfat)"
fi
