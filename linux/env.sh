#!/usr/bin/env bash
set -Eeuo pipefail

log() { printf '[%s] %s\n' "$(date +'%F %T')" "$*"; }

POSTENV_USER="${SUDO_USER:-$(id -un)}"
POSTENV_GROUP="$(id -gn "$POSTENV_USER")"
POSTENV_HOME="$(getent passwd "$POSTENV_USER" | cut -d: -f6)"

: "${POSTENV_PATH:="$POSTENV_HOME/postenv"}"

export POSTENV_USER POSTENV_GROUP POSTENV_HOME POSTENV_PATH
