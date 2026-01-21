#!/usr/bin/env bash
WORKDIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
source "$WORKDIR/env.sh"

log "Applying postenv from $POSTENV_PATH"

sudo -E bash "$WORKDIR/root.sh"
bash "$WORKDIR/user.sh"

log "postenv apply completed"
