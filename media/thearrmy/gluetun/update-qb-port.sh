#!/bin/sh
set -eu

PORT="${1:-}"
VPN_INTERFACE="${2:-tun0}"
QB_URL="http://127.0.0.1:8080"

if [ -z "$PORT" ]; then
  echo "Missing forwarded port" >&2
  exit 1
fi

case "$PORT" in
  ''|*[!0-9]*)
    echo "Invalid forwarded port: $PORT" >&2
    exit 1
    ;;
esac

PAYLOAD='json={"listen_port":'"$PORT"',"current_network_interface":"'"$VPN_INTERFACE"'","random_port":false,"upnp":false}'

for attempt in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30; do
  if wget -qO- --post-data "$PAYLOAD" "$QB_URL/api/v2/app/setPreferences" >/dev/null 2>&1; then
    PREFS="$(wget -qO- "$QB_URL/api/v2/app/preferences" 2>/dev/null || true)"
    case "$PREFS" in
      *"\"listen_port\":$PORT"*)
        echo "qBittorrent listening port set to $PORT on $VPN_INTERFACE"
        exit 0
        ;;
    esac
  fi

  echo "Waiting for qBittorrent WebUI before applying port $PORT (attempt $attempt/30)" >&2
  sleep 2
done

echo "Failed to set qBittorrent listening port to $PORT after 30 attempts" >&2
exit 1
