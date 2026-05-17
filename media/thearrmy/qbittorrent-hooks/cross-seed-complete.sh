#!/bin/sh

set -eu

info_hash=${1:-}
api_key=${CROSS_SEED_API_KEY:-}

if [ -z "$info_hash" ]; then
  exit 0
fi

if [ -z "$api_key" ]; then
  exit 1
fi

/usr/bin/curl -fsS -X POST "http://cross-seed:2468/api/webhook" \
  -H "X-Api-Key: $api_key" \
  -d "infoHash=$info_hash" \
  -d "includeSingleEpisodes=true" \
  >/dev/null
