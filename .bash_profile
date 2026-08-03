export PATH="$PATH:~/.local/bin"
export VISUAL=nvim
export EDITOR=nvim
export GOPASS_CLIPBOARD_COPY_CMD="gopass-copy.sh"
export SUDO_ASKPASS="$HOME/.config/bash/sudo-askpass.sh"  # NOTE: must expand explicitly with $HOME

command -v gpgconf > /dev/null 2>&1 && export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

[[ -f ~/.bashrc ]] && . ~/.bashrc
