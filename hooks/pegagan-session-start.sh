#!/bin/bash
# Pegagan SessionStart Hook
# Inject previous session context into Claude's context window

MEMORY_DIR="$HOME/.claude/projects/-Users-agungperkasa-Sandbox-orbit/memory"
STATE_FILE="$HOME/Sandbox/orbit/.planning/STATE.md"
PEGAGAN_STATE="$MEMORY_DIR/pegagan-state.md"

# Read Quick Summary from STATE.md (stop at ADR section)
STATE_SUMMARY=""
if [ -f "$STATE_FILE" ]; then
  STATE_SUMMARY=$(sed '/^# ADR/q' "$STATE_FILE" | head -10)
fi

# Read Pegagan state
PEGAGAN_CONTEXT=""
if [ -f "$PEGAGAN_STATE" ]; then
  PEGAGAN_CONTEXT=$(head -20 "$PEGAGAN_STATE")
fi

# Build context injection
CONTEXT="## Pegagan Auto-Context (previous session)

### Project State
$STATE_SUMMARY

### Pegagan Last State
$PEGAGAN_CONTEXT

---
*Auto-injected by Pegagan SessionStart hook. Run /catchup untuk full context.*"

# Output as JSON for Claude Code injection
echo "{\"hookSpecificOutput\": {\"hookEventName\": \"SessionStart\", \"additionalContext\": $(echo "$CONTEXT" | python3 -c 'import json,sys; print(json.dumps(sys.stdin.read()))')}}"
