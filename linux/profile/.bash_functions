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
