#!/usr/bin/env bash
# Install the typography skills for Claude Code, Codex, or both.
#
#   ./install.sh            → Claude Code (~/.claude/skills)
#   ./install.sh --codex    → Codex (~/.agents/skills)
#   ./install.sh --all      → both
#   ./install.sh --target D → a directory you choose
#
# Symlinks, so `git pull` updates every install.

set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC="$REPO/skills"
targets=()

while [ $# -gt 0 ]; do
  case "$1" in
    --codex)  targets+=("$HOME/.agents/skills") ;;
    --all)    targets+=("$HOME/.claude/skills" "$HOME/.agents/skills") ;;
    --target) shift; targets+=("$1") ;;
    -h|--help) sed -n '2,10p' "${BASH_SOURCE[0]}" | sed 's/^# \{0,1\}//'; exit 0 ;;
    *) echo "unknown option: $1" >&2; exit 1 ;;
  esac
  shift
done
[ ${#targets[@]} -eq 0 ] && targets=("$HOME/.claude/skills")

[ -d "$SRC" ] || { echo "error: $SRC not found" >&2; exit 1; }

for dest in "${targets[@]}"; do
  mkdir -p "$dest"
  echo "→ $dest"
  linked=0 skipped=0
  for skill in "$SRC"/*/; do
    name="$(basename "$skill")"
    link="$dest/$name"
    if [ -L "$link" ] && [ "$(readlink "$link")" = "${skill%/}" ]; then
      skipped=$((skipped+1)); continue
    fi
    if [ -e "$link" ] && [ ! -L "$link" ]; then
      echo "   skip $name (a real file/dir already exists there)"
      skipped=$((skipped+1)); continue
    fi
    ln -sfn "${skill%/}" "$link"
    linked=$((linked+1))
  done
  echo "   $linked linked, $skipped already present"
done

echo
echo "Done. Use /type in your agent to route a typography task."
