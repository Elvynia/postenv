#!/usr/bin/env bash
set -Eeuo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
source "$SCRIPT_DIR/env.sh"

log() { printf '[%s] %s\n' "$(date +'%F %T')" "$*"; }

if [[ "$EUID" -ne 0 ]]; then
  exec sudo -E bash "$0"
fi

log "Applying postenv from $POSTENV_PATH"
log "Real user: $POSTENV_USER"

bash "$SCRIPT_DIR/root.sh"
bash "$SCRIPT_DIR/user.sh"

log "postenv apply completed"
