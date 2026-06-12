#!/usr/bin/env bash
set -euo pipefail

SOURCE="${1:-/Users/juanmamolinncortes/Documentos/ng-flor-loto/src/assets}"
TARGET="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/themes/flordeloto/assets"

if [ ! -d "$SOURCE" ]; then
  echo "Source asset directory not found: $SOURCE" >&2
  exit 1
fi

REQUIRED_ASSETS=(
  "img/logo-loto.png"
  "img/logo-new-loto.jpg"
  "img/logo-loto-horizontal.png"
  "img/products"
  "img/recommends"
  "img/icons-services"
  "img/icons-dial"
  "img/opinions"
  "img/no-image.jpg"
)

for asset in "${REQUIRED_ASSETS[@]}"; do
  if [ ! -e "$SOURCE/$asset" ]; then
    echo "Required asset missing: $SOURCE/$asset" >&2
    exit 1
  fi
done

mkdir -p "$TARGET/img"
cp -R "$SOURCE/img/logo-loto.png" "$TARGET/img/"
cp -R "$SOURCE/img/logo-new-loto.jpg" "$TARGET/img/"
cp -R "$SOURCE/img/logo-loto-horizontal.png" "$TARGET/img/"
cp -R "$SOURCE/img/products" "$TARGET/img/"
cp -R "$SOURCE/img/recommends" "$TARGET/img/"
cp -R "$SOURCE/img/icons-services" "$TARGET/img/"
cp -R "$SOURCE/img/icons-dial" "$TARGET/img/"
cp -R "$SOURCE/img/opinions" "$TARGET/img/"
cp -R "$SOURCE/img/no-image.jpg" "$TARGET/img/"
