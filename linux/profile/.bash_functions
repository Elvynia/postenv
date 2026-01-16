#!/usr/bin/env bash
cdzf () {
  local dir
  dir=$(find $0 -type d | fzf)
  if [[ -n "$dir" ]]; then
    cd "$dir" || return
  fi
}

mkcd () {
    mkdir $1;
    cd $1;
    return 0;
}

la () {
    ll $1*
}

pwg() {
    chars='@$.,;:!?+=-_*'
    { </dev/urandom LC_ALL=C grep -ao '[A-Za-z0-9]' \
            | head -n$((RANDOM % 8 + 9))
        echo ${chars:$((RANDOM % ${#chars})):1}   # Random special char.
    } \
        | shuf \
        | tr -d '\n'
}
