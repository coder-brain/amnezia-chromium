#!/bin/bash

PROFILE_DIR="~/.config/chromium"

echo "🧹 Cleaning up Chromium lock files..."
rm -f "$PROFILE_DIR/SingletonLock" \
      "$PROFILE_DIR/SingletonSocket" \
      "$PROFILE_DIR/SingletonCookie"

echo "🚀 Starting Chromium..."
exec chromium \
  --no-sandbox \
  --disable-dev-shm-usage \
  "$@"