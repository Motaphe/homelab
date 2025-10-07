# Homelab Docker Configurations

This repository contains Docker Compose configurations for various self-hosted services in a homelab environment.


## 🛠️ Setup Instructions

### 1. Media Stack

```bash
cd media/
cp .env.example .env
# Edit .env with your actual values
docker-compose up -d
```

**Services included:**
- Jellyfin (media server)
- Radarr, Sonarr, Bazarr, Prowlarr (*arr suite)
- qBittorrent (with VPN via Gluetun)
- FlareSolverr (for torrent sites)
- Jellyseerr (request management)

### 2. Nextcloud

**Important:** Follow this guide for proper setup: [Easy setup: Container-less Tailscale as reverse proxy](https://github.com/nextcloud/all-in-one/discussions/6817)

```bash
cd personal/nextcloud/
docker-compose up -d
```

**Features:**
- Nextcloud AIO with Collabora Office
- Tailscale integration for secure access
- Caddy reverse proxy with automatic HTTPS

### 3. Immich

```bash
cd personal/immich-app/
cp .env.example .env
# Edit .env with your database credentials
docker-compose up -d
```

**Features:**
- Photo and video management
- AI-powered face recognition
- Mobile app support