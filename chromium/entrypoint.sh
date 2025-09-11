#!/bin/bash
set -e

PROFILE_DIR="$HOME/.config/chromium"

echo "🧹 Cleaning up Chromium lock files in $PROFILE_DIR..."
rm -f "$PROFILE_DIR/SingletonLock" \
      "$PROFILE_DIR/SingletonSocket" \
      "$PROFILE_DIR/SingletonCookie"

echo "🚀 Starting Chromium..."
exec chromium \
  --no-sandbox \
  --disable-dev-shm-usage \
  --enable-features=UseOzonePlatform \
  --ozone-platform=x11 \
  "$@"