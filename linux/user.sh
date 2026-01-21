#!/usr/bin/env bash
source "$(dirname "$0")/env.sh"

log "Installing bash profile for user"
bash $POSTENV_PATH/linux/profile/install.sh \
  --home "$POSTENV_HOME" \
  --user "$POSTENV_USER" \
  --dev "${POSTENV_DEV:-0}"

log "Installing bash profile for root"
sudo -E bash $POSTENV_PATH/linux/profile/install.sh \
  --home /root \
  --user root \
  --dev "${POSTENV_DEV:-0}"

log "Installing git config for user"
sudo -u "$POSTENV_USER" \
  HOME="$POSTENV_HOME" \
  bash $POSTENV_PATH/linux/git/install.sh
