#!/usr/bin/env bash
# Bootstrap installer entrypoint

# Fail fast, fail loud
set -Eeuo pipefail

# Capture all output
LOG_FILE="/var/log/lv/postenv.log"
exec > >(tee -a "$LOG_FILE") 2>&1

# Disable interactive prompts
export DEBIAN_FRONTEND=noninteractive

# Ensure full root execution
if [ "$EUID" -ne 0 ]; then
  exec sudo -E bash "$0" "$@"
fi

# Detect operating system
. /etc/os-release

# Allow only ubuntu/debian
case "$ID" in
  ubuntu|debian) ;;
  *)
    echo "Unsupported OS"
    exit 1
    ;;
esac

# Install location
INSTALL_DIR="/opt/lv/postenv"

# Git repo
REPO_URL="https://github.com/Elvynia/postenv.git"

# Version / tag / branch to pin
REPO_VERSION="main"

# Install minimal bootstrap dependencies
if ! command -v git >/dev/null 2>&1; then
  apt-get update
  apt-get install -y git ca-certificates curl
fi

# Clone repository if not already present
if [ ! -d "$INSTALL_DIR/.git" ]; then
  git clone \
    --branch "$REPO_VERSION" \
    --depth 1 \
    "$REPO_URL" \
    "$INSTALL_DIR"
fi

# Hand off to the real installer
cd "$INSTALL_DIR"
exec bash main.sh
