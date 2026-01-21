#!/usr/bin/env bash
set -Eeuo pipefail
source "$(dirname "$0")/env.sh"

log() { printf '[%s] %s\n' "$(date +'%F %T')" "$*"; }

log "Installing bash profile for user"
bash linux/profile/install.sh \
  --home "$POSTENV_HOME" \
  --user "$POSTENV_USER" \
  --dev "${POSTENV_DEV:-0}"

log "Installing bash profile for root"
bash linux/profile/install.sh \
  --home /root \
  --user root \
  --dev "${POSTENV_DEV:-0}"

log "Installing git config for user"
sudo -u "$POSTENV_USER" \
  HOME="$POSTENV_HOME" \
  bash linux/git/install.sh
