#!/usr/bin/env bash
set -u

# - means off, `echo` pipes input to terminal, icanon makes `read` handle input
# we don't want to show passwd, and we will handle the input stream ourselves
old_stty=$(stty -g < /dev/tty)
stty -echo -icanon min 1 time 0 < /dev/tty
restore() { stty "$old_stty" < /dev/tty; printf '\r\n' > /dev/tty; }
# run cmd on exit, no matter how the script exits
# trap restore EXIT INT TERM
trap 'restore; exit 130' INT TERM
trap restore EXIT


CHARSET='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz    ,.<>?;:[]{}-_=+!@#$%^&*()~`'
CHARSET_LEN=${#CHARSET}
NUM_ADD=5

erase_chars() {
    for ((i = 0; i < $1; i++)); do printf '\b \b' > /dev/tty; done
}


prompt="${1:-[sudo] password for $USER: }"
if [[ $(ps -o comm= -p "$PPID" 2>/dev/null) != *sudo* ]]; then
    prompt=$'\033[31;1m[Not sudo]\033[0m enter password at your own risk: '
fi
printf '%s' "$prompt" > /dev/tty

passwd=""
disp_len=0
# IFS set to '' means that no separator is used
# \x7f backspace, \x08 ctrl+h, \x15 ctrl+u, \x17 ctrl+w
while IFS= read -r -s -n 1 char; do
    [[ -z $char ]] && break

    if [[ $char == $'\x7f' || $char == $'\x08' ]]; then
        if [[ -n $passwd ]]; then
            passwd=${passwd%?}
            if [[ -z $passwd ]]; then
                erase_n=$disp_len
            else
                erase_n=$(( RANDOM % NUM_ADD ))
                (( disp_len - erase_n < 1 )) && erase_n=$(( disp_len - 1 ))
            fi
            erase_chars erase_n
            disp_len=$(( disp_len - erase_n ))
        fi
    elif [[ $char == $'\x15' || $char == $'\x17' ]]; then
        erase_chars disp_len
        passwd=""
        disp_len=0
    else
        passwd+="$char"
        delta=$(( 1 + RANDOM % (NUM_ADD - 1) ))
        for ((i = 0; i < delta; i++)); do
            idx=$(( RANDOM % CHARSET_LEN ))
            printf '%s' "${CHARSET:idx:1}" > /dev/tty
        done
        disp_len=$(( disp_len + delta ))
    fi
done < /dev/tty

restore
trap - EXIT INT TERM

printf '%s\n' "$passwd"
