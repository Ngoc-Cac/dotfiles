#!/usr/bin/env bash
# _cmd_exists is a utility function in .bashrc

_cmd_exists gpgconf && export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

# This is needed for SSH sessions to use pinentry-curses
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye &> /dev/null
