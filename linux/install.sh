#!/usr/bin/env bash
# Bootstrap installer entrypoint

# Fail fast, fail loud
set -Eeuo pipefail

# Disable interactive prompts
export DEBIAN_FRONTEND=noninteractive

USER="${SUDO_USER:-$(id -un)}"
GROUP="$(id -gn "$USER")"
# Ensure full root execution
if [ "$EUID" -ne 0 ]; then
export USER GROUP
  exec sudo -E bash -s "$@" < /dev/stdin
fi

# Capture all output
LOG_DIR="/var/log/lv"
LOG_FILE="$LOG_DIR/postenv.log"
mkdir -p "$LOG_DIR"
exec > >(tee -a "$LOG_FILE") 2>&1

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
  chown -R "$USER:$GROUP" "$INSTALL_DIR"
fi

# Hand off to the real installer
cd "$INSTALL_DIR" || exit 1
exec bash linux/main.sh
