#!/usr/bin/env bash
# Converte as fotos do Playwright (png/, fora do git) em img/*.webp, com até 1600 px de largura.
set -euo pipefail
cd "$(dirname "$0")"
for f in png/*.png; do
  ffmpeg -hide_banner -loglevel error -y -i "$f" -vf "scale='min(1600,iw)':-2" -c:v libwebp -quality 82 "img/$(basename "${f%.png}").webp"
done
cp ~/projetos/AplicarAgro/public/logo.webp ~/projetos/AplicarAgro/public/icone.webp img/
