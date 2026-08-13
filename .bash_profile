export PATH="$PATH:~/.local/bin"
export TERM='xterm-direct'
export LESS="-R"  # auto colour support
export VISUAL=nvim
export EDITOR=nvim

command -v gpgconf > /dev/null 2>&1 && export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

[[ -f ~/.bashrc ]] && . ~/.bashrc
