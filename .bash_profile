export PATH="$PATH:~/.local/bin"
export LESS="-R"  # auto colour support
export VISUAL=nvim
export EDITOR=nvim
export GOPASS_CLIPBOARD_COPY_CMD="gopass-copy.sh"
export SUDO_ASKPASS="$HOME/.config/bash/sudo-askpass.sh"  # NOTE: must expand explicitly with $HOME

[[ -f ~/.bashrc ]] && . ~/.bashrc
