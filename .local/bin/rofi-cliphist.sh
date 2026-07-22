#!/usr/bin/env bash

_cliphist_rofi_img() {
    if [[ -n "$1" ]]; then
        cliphist decode <<<"$1" | wl-copy
        exit 0
    fi

    local tmp_dir="/tmp/cliphist"
    rm -rf "$tmp_dir"
    mkdir -p "$tmp_dir"

    local prog
    read -r -d '' prog <<EOF
/^[0-9]+\s<meta http-equiv=/ { next }
match(\$0, /^([0-9]+)\s(\[\[\s)?binary.*(jpg|jpeg|png|bmp)/, grp) {
    system("echo " grp[1] "\\\\\t | cliphist decode >$tmp_dir/"grp[1]"."grp[3])
    print \$0"\0icon\x1f$tmp_dir/"grp[1]"."grp[3]
    next
}
1
EOF

    cliphist list | gawk "$prog"
}

export -f _cliphist_rofi_img

# rofi is supposed to pass the value in the second call. However, that command
# then becomes sth like bash -c _cliphist_rofi_img value which passes value to
# bash command instead, which coincidentally also assigns this to $0, $1, etc.
# Here, we use _cliphist_rofi_img $@ which expands everything from $1, $2, ...
# into the function call.
rofi -modi "Clipboards:bash -c '_cliphist_rofi_img \"\$@\"' temp" \
    -show Clipboards \
    -theme ~/.config/rofi/cliphist.rasi
