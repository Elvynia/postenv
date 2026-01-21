#!/usr/bin/env bash
set -Eeuo pipefail
source "$(dirname "$0")/env.sh"

log() { printf '[%s] %s\n' "$(date +'%F %T')" "$*"; }

log "Installing system packages"
apt-get update
apt-get install -y git fzf bat
