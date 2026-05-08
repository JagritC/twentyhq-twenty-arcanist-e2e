#!/usr/bin/env bash
set -euo pipefail

if pgrep -f "nx run-many -t start" >/dev/null || pgrep -f "vite.*3001" >/dev/null; then
  echo "[arcanist-runtime] Live reset skipped; restart the runtime for a clean seeded database."
  exit 0
fi

bash scripts/arcanist-runtime-seed.sh
