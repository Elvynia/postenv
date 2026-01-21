#!/usr/bin/env bash
set -Eeuo pipefail

while [[ $# -gt 0 ]]; do
  case "$1" in
    --home) TARGET_HOME="$2"; shift 2 ;;
    --user) TARGET_USER="$2"; shift 2 ;;
    --dev) DEV_MODE="$2"; shift 2 ;;
    *) exit 1 ;;
  esac
done

WORKDIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

install -m 0644 "$WORKDIR"/.bash_aliases "$TARGET_HOME/.bash_aliases"
install -m 0644 "$WORKDIR"/.bash_functions "$TARGET_HOME/.bash_functions"

if [[ "$DEV_MODE" == "1" ]]; then
  install -m 0644 "$WORKDIR"/.bash_postenv "$TARGET_HOME/.bash_postenv"
fi

BASHRC="$TARGET_HOME/.bashrc"
touch "$BASHRC"

ensure() {
  grep -qxF "$1" "$BASHRC" || echo "$1" >> "$BASHRC"
}

ensure '[ -f ~/.bash_aliases ] && . ~/.bash_aliases'
ensure '[ -f ~/.bash_functions ] && . ~/.bash_functions'
ensure '[ -f ~/.bash_postenv ] && . ~/.bash_postenv'

chown "$TARGET_USER:$TARGET_USER" \
  "$TARGET_HOME"/.bash_* \
  "$BASHRC" || true

if [ -t 1 ]; then
    source ~/.bashrc
fi
