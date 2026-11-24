#!/usr/bin/env bash

# Copy app-owned configs from seed/ into $HOME, but only if they don't exist yet.
#
# Some apps (Zed, gh, ...) rewrite their own config files. If those files were
# symlinked, every change in the app would dirty this repo and block `git pull`.
# Instead, the repo keeps a baseline in seed/ and the app owns the live copy.
# Use ./scripts/sync.sh to compare live copies with the baseline.

set -e

DOTFILES=${DOTFILES:-"$(cd "$(dirname "$0")/.." && pwd)"}
SEED_DIR="$DOTFILES/seed"

cd "$SEED_DIR" || exit

find . -type f ! -name '.DS_Store' | while read -r file; do
  target="$HOME/${file#./}"

  if [[ -e "$target" || -L "$target" ]]; then
    continue
  fi

  mkdir -p "$(dirname "$target")"
  cp "$file" "$target"
  echo "Seeded $target"
done
