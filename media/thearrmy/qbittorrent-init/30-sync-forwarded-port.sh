#!/usr/bin/with-contenv sh

(
  PORT_FILE="/gluetun/forwarded_port"

  for _ in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60; do
    if [ -s "$PORT_FILE" ]; then
      read -r PORT < "$PORT_FILE" || PORT=""
      case "$PORT" in
        ''|*[!0-9]*)
          ;;
        *)
          /gluetun/update-qb-port.sh "$PORT" tun0 && exit 0
          ;;
      esac
    fi

    sleep 2
  done

  echo "No forwarded Gluetun port was synced to qBittorrent during startup" >&2
) &

exit 0
