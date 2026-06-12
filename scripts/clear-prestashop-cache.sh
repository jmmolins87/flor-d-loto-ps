#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

rm -rf var/cache/dev/* var/cache/prod/* cache/smarty/cache/* cache/smarty/compile/* 2>/dev/null || true

if [ -f ./bin/console ]; then
  php ./bin/console cache:clear --env=prod --no-warmup || true
  php ./bin/console cache:clear --env=dev --no-warmup || true
fi
