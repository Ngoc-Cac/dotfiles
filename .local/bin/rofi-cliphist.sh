#!/usr/bin/env bash

_cliphist_rofi_img() {
    local tmp_dir="/tmp/cliphist"
    rm -rf "$tmp_dir"

    if [[ -n "$1" ]]; then
        cliphist decode <<<"$1" | wl-copy
        exit 0
    fi

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

rofi -modi "Clipboards:bash -c _cliphist_rofi_img" \
    -show Clipboards \
    -theme ~/.config/rofi/cliphist.rasi
