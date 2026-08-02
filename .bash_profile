export VISUAL=nvim
export EDITOR=nvim
export GOPASS_CLIPBOARD_COPY_CMD="gopass-copy.sh"
export PATH="$PATH:~/.local/bin"

command -v gpgconf > /dev/null 2>&1 && export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

[[ -f ~/.bashrc ]] && . ~/.bashrc
