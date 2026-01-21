#!/usr/bin/env bash
set -Eeuo pipefail

POSTENV_PATH="${POSTENV_PATH:-$HOME/postenv}"
export POSTENV_PATH POSTENV_DEV=1

if [[ ! -d "$POSTENV_PATH/.git" ]]; then
  git clone https://github.com/Elvynia/postenv.git "$POSTENV_PATH"
else
  git -C "$POSTENV_PATH" pull --rebase
fi

bash "$POSTENV_PATH/linux/apply.sh"
