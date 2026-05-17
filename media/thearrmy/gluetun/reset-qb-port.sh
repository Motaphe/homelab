#!/bin/sh
set -eu

QB_URL="http://127.0.0.1:8080"
PAYLOAD='json={"listen_port":0,"current_network_interface":"lo","random_port":false,"upnp":false}'

for _ in 1 2 3 4 5 6 7 8 9 10; do
  if wget -qO- --post-data "$PAYLOAD" "$QB_URL/api/v2/app/setPreferences" >/dev/null 2>&1; then
    echo "qBittorrent listening port reset after VPN disconnect"
    exit 0
  fi

  sleep 1
done

echo "Failed to reset qBittorrent listening port after VPN disconnect" >&2
exit 1
