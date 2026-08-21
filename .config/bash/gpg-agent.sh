#!/usr/bin/env bash
# _cmd_exists is a utility function in .bashrc

_cmd_exists gpgconf && export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

if [[ -n "$SSH_TTY" || -n "$SSH_CLIENT" ]]; then
    export GPG_TTY=$(tty)
    pin_path=$(command -v pinentry-curses)
    gpg-connect-agent "OPTION pinentry-program=$pin_path" updatestartuptty /bye &> /dev/null
fi
