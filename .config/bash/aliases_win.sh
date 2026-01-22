#!/usr/bin/env bash
# for making symlinks ON WINDOWS
alias mklink='cmd //c mklink'
alias sudo='gsudo'

# windows explorer
# see this https://github.com/microsoft/WSL/issues/6565 for why the function 
explorer() { command explorer "$@" || true; }
alias wx="explorer"
