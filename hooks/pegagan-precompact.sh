#!/bin/bash
# Pegagan PreCompact Hook — Safety net sebelum context di-compress
# State sudah tersimpan via Stop hook, ini hanya safety marker

SESSIONS_DIR="$HOME/.claude/sessions"
LOG_FILE="$SESSIONS_DIR/compaction-log.txt"

mkdir -p "$SESSIONS_DIR"

TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
echo "[$TIMESTAMP] Compaction triggered" >> "$LOG_FILE"

# Find and mark the latest session file
LATEST=$(ls -t "$SESSIONS_DIR"/*-session.tmp 2>/dev/null | head -1)
if [ -n "$LATEST" ]; then
  echo "" >> "$LATEST"
  echo "<!-- [Compaction at $TIMESTAMP] Context was summarized -->" >> "$LATEST"
fi

exit 0
