#!/usr/bin/env bash
set -euo pipefail

cat >packages/twenty-server/.env <<'ENV'
NODE_ENV=development
PORT=3000
PG_DATABASE_URL=postgres://postgres:postgres@db:5432/default
REDIS_URL=redis://redis:6379
APP_SECRET=arcanist_benchmark_not_secret
SERVER_URL=http://localhost:3000
FRONTEND_URL=http://localhost:3001
SIGN_IN_PREFILLED=true
IS_WORKSPACE_CREATION_LIMITED_TO_SERVER_ADMINS=false
AUTH_PASSWORD_ENABLED=false
IS_EMAIL_VERIFICATION_REQUIRED=false
IS_BILLING_ENABLED=false
STORAGE_TYPE=local
STORAGE_LOCAL_PATH=.local-storage
EMAIL_DRIVER=LOGGER
LOG_LEVELS=error,warn
LOGGER_DRIVER=CONSOLE
ENV

cat >packages/twenty-front/.env <<'ENV'
REACT_APP_SERVER_BASE_URL=http://localhost:3000
REACT_APP_PORT=3001
VITE_BUILD_SOURCEMAP=false
ENV
