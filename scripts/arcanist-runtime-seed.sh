#!/usr/bin/env bash
set -euo pipefail

bash scripts/arcanist-runtime-env.sh
yarn nx run twenty-server:database:reset --configuration=seed
