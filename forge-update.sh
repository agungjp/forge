#!/usr/bin/env bash
# forge-update.sh — Update vendor snapshot ke latest upstream
# Usage: ./forge-update.sh <vendor-name>
# Example: ./forge-update.sh agency-agents

set -e

VENDOR=$1
FORGE_DIR="$(cd "$(dirname "$0")" && pwd)"
VENDOR_DIR="$FORGE_DIR/vendor/$VENDOR"
DATE=$(date +%Y-%m-%d)

if [ -z "$VENDOR" ]; then
  echo "Usage: ./forge-update.sh <vendor-name>"
  echo "Available: agency-agents, bmad-method, everything-claude-code, superpowers, gsd, gstack"
  exit 1
fi

download_files() {
  local repo=$1
  local filter=$2
  local dest=$3
  gh api "repos/$repo/git/trees/main?recursive=1" --jq '.tree[] | select(.type=="blob") | .path' | grep -E "$filter" | while read f; do
    mkdir -p "$dest/$(dirname $f)"
    content=$(gh api "repos/$repo/contents/$f" --jq '.content' 2>/dev/null)
    if [ -n "$content" ] && [ "$content" != "null" ]; then
      echo "$content" | base64 -d > "$dest/$f" 2>/dev/null || true
    fi
  done
}

case "$VENDOR" in
  agency-agents)
    echo "Updating agency-agents..."
    rm -rf "$VENDOR_DIR" && mkdir -p "$VENDOR_DIR"
    download_files "msitarzewski/agency-agents" "\.md$" "$VENDOR_DIR"
    COMMIT=$(gh api repos/msitarzewski/agency-agents/commits/main --jq '.sha[0:8]')
    ;;
  bmad-method)
    echo "Updating bmad-method..."
    rm -rf "$VENDOR_DIR" && mkdir -p "$VENDOR_DIR"
    download_files "bmad-code-org/BMAD-METHOD" "^src/bmm" "$VENDOR_DIR"
    COMMIT=$(gh api repos/bmad-code-org/BMAD-METHOD/commits/main --jq '.sha[0:8]')
    ;;
  everything-claude-code)
    echo "Updating everything-claude-code..."
    rm -rf "$VENDOR_DIR" && mkdir -p "$VENDOR_DIR"
    for dir in agents .agents/skills rules commands hooks; do
      download_files "affaan-m/everything-claude-code" "^$dir.*(\.md|\.json|\.js)$" "$VENDOR_DIR"
    done
    COMMIT=$(gh api repos/affaan-m/everything-claude-code/commits/main --jq '.sha[0:8]')
    ;;
  superpowers)
    echo "Updating superpowers..."
    rm -rf "$VENDOR_DIR" && mkdir -p "$VENDOR_DIR"
    download_files "obra/superpowers" "\.md$" "$VENDOR_DIR"
    COMMIT=$(gh api repos/obra/superpowers/commits/main --jq '.sha[0:8]')
    ;;
  gsd)
    echo "Updating gsd..."
    rm -rf "$VENDOR_DIR" && mkdir -p "$VENDOR_DIR"
    download_files "gsd-build/get-shit-done" "^(references|templates).*(\.md|\.json)$" "$VENDOR_DIR"
    COMMIT=$(gh api repos/gsd-build/get-shit-done/commits/main --jq '.sha[0:8]')
    ;;
  gstack)
    echo "Updating gstack..."
    rm -rf "$VENDOR_DIR" && mkdir -p "$VENDOR_DIR"
    download_files "garrytan/gstack" "\.md$" "$VENDOR_DIR"
    COMMIT=$(gh api repos/garrytan/gstack/commits/main --jq '.sha[0:8]')
    ;;
  *)
    echo "Unknown vendor: $VENDOR"
    echo "Available: agency-agents, bmad-method, everything-claude-code, superpowers, gsd, gstack"
    exit 1
    ;;
esac

# Update SOURCES.md pinned commit untuk vendor ini
if [ -f "$FORGE_DIR/vendor/SOURCES.md" ] && [ -n "$COMMIT" ] && command -v python3 >/dev/null 2>&1; then
  python3 - "$FORGE_DIR/vendor/SOURCES.md" "$VENDOR" "$COMMIT" <<'PYEOF'
import sys
filepath, vendor, commit = sys.argv[1], sys.argv[2], sys.argv[3]
try:
    with open(filepath, 'r') as f:
        lines = f.readlines()
    for i, line in enumerate(lines):
        if f'| {vendor} |' in line and '(unpinned)' in line:
            lines[i] = line.replace('(unpinned)', commit, 1)
    with open(filepath, 'w') as f:
        f.writelines(lines)
except Exception:
    pass
PYEOF
fi

echo ""
echo "Done. $VENDOR updated to commit $COMMIT on $DATE"
echo "Remember: update forge-native layer jika ada breaking changes di vendor."
