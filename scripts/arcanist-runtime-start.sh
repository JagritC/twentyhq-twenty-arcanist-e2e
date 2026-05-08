#!/usr/bin/env bash
set -euo pipefail

bash scripts/arcanist-runtime-env.sh

run_step() {
  local name="$1"
  shift
  local log="/tmp/arcanist-runtime-${name}.log"

  echo "[arcanist-runtime] ${name}..."

  if "$@" >"${log}" 2>&1; then
    echo "[arcanist-runtime] ${name} complete (${log})"
  else
    echo "[arcanist-runtime] ${name} failed; last log lines:"
    tail -120 "${log}" || true
    return 1
  fi
}

run_step corepack corepack enable
run_step yarn-install yarn install --immutable
run_step database-reset yarn nx run twenty-server:database:reset --configuration=seed

yarn start
