#!/usr/bin/env bash
source "$(dirname "$0")/env.sh"

log "Installing system packages"
apt-get update
apt-get install -y git fzf bat
