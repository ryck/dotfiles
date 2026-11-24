#!/usr/bin/env bash

# Compare app-owned live configs in $HOME with their baseline in seed/.
#
# Usage:
#   ./scripts/sync.sh          show a diff (live → seed)
#   ./scripts/sync.sh --pull   copy live configs into seed/ (then review and commit)

DOTFILES=${DOTFILES:-"$(cd "$(dirname "$0")/.." && pwd)"}
SEED_DIR="$DOTFILES/seed"

cd "$SEED_DIR" || exit

find . -type f ! -name '.DS_Store' | while read -r file; do
  live="$HOME/${file#./}"

  [[ -f "$live" ]] || continue

  if [[ "$1" == "--pull" ]]; then
    if ! cmp -s "$file" "$live"; then
      cp "$live" "$file"
      echo "Updated seed/${file#./}"
    fi
  else
    diff -u --label "seed/${file#./}" --label "$live" "$file" "$live"
  fi
done

exit 0
