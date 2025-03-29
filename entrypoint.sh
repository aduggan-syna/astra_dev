#!/bin/bash

TARGET_DIR="/home/syna"

if [ -d "$TARGET_DIR" ]; then
  OWNER=$(stat -c "%U" "$TARGET_DIR")
  if [ "$OWNER" != "syna" ]; then
    echo "Fixing ownership of $TARGET_DIR..."
    sudo chown -R syna:syna "$TARGET_DIR"
  fi
fi

exec tail -f /dev/null
