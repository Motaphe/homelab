#!/bin/sh
# Automatically update qBittorrent listening port when gluetun forwards a new port
# {{PORT}} is replaced by gluetun with the actual forwarded port number

wget -O- --retry-connrefused --post-data "json={\"listen_port\":{{PORT}},\"random_port\":false,\"upnp\":false}" \
  http://127.0.0.1:8080/api/v2/app/setPreferences 2>&1

echo "qBittorrent port updated to {{PORT}}"