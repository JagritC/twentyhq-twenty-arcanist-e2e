#!/usr/bin/env bash
set -euo pipefail

bash scripts/arcanist-runtime-env.sh

if pgrep -f "nx run-many -t start" >/dev/null || pgrep -f "vite.*3001" >/dev/null; then
  echo "[arcanist-runtime] Seed data is created during startup; live seed is a no-op."
  exit 0
fi

yarn nx run twenty-server:database:reset --configuration=seed
