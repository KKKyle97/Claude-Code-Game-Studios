#!/usr/bin/env bash
# install.sh — Install Claude Code Game Studio into a Unreal Engine 5 project

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

usage() {
  echo ""
  echo "Usage:   bash install.sh <path-to-ue-project>"
  echo "Example: bash install.sh \"C:/Users/You/Unreal Projects/MyGame\""
  echo ""
  exit 1
}

# ── Argument check ────────────────────────────────────────────────────────────
if [ -z "$1" ]; then
  echo "Error: No project path provided."
  usage
fi

TARGET="$1"

# ── Validate target directory ─────────────────────────────────────────────────
if [ ! -d "$TARGET" ]; then
  echo "Error: Directory not found: $TARGET"
  exit 1
fi

# ── Check for .uproject file ──────────────────────────────────────────────────
if ! ls "$TARGET"/*.uproject 1>/dev/null 2>&1; then
  echo "Warning: No .uproject file found in $TARGET"
  read -rp "         Continue anyway? (y/N): " confirm
  echo ""
  [[ "$confirm" =~ ^[Yy]$ ]] || exit 0
fi

echo ""
echo "Installing Claude Code Game Studio into:"
echo "  $TARGET"
echo ""

# ── Copy .claude/ ─────────────────────────────────────────────────────────────
echo "[1/3] Copying .claude/ ..."
cp -r "$SCRIPT_DIR/.claude" "$TARGET/"

# ── Copy docs/engine-reference/unreal/ ───────────────────────────────────────
echo "[2/3] Copying docs/engine-reference/unreal/ ..."
mkdir -p "$TARGET/docs/engine-reference"
cp -r "$SCRIPT_DIR/docs/engine-reference/unreal" "$TARGET/docs/engine-reference/"

# ── Copy CLAUDE.md ────────────────────────────────────────────────────────────
if [ -f "$TARGET/CLAUDE.md" ]; then
  echo "[3/3] CLAUDE.md already exists — skipped."
  echo "      Edit it manually to add your game name and concept."
else
  echo "[3/3] Copying CLAUDE.md ..."
  cp "$SCRIPT_DIR/CLAUDE.md" "$TARGET/"
fi

echo ""
echo "Done! Studio installed."
echo ""
echo "Next steps:"
echo "  1. Open CLAUDE.md in $TARGET and describe your game"
echo "  2. cd \"$TARGET\" && claude"
echo "  3. Type /start"
echo ""
