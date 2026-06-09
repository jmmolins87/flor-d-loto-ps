#!/usr/bin/env bash
set -euo pipefail

SOURCE="/Users/juanmamolinncortes/Documentos/ng-flor-loto/src/assets"
TARGET="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/themes/flordeloto/assets"

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
