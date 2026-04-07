# Calibre — Home Assistant App

A [Home Assistant](https://www.home-assistant.io) app that runs [Calibre](https://calibre-ebook.com) — a powerful e-book management application — using the [LinuxServer.io Docker image](https://hub.docker.com/r/linuxserver/calibre).

Access the full Calibre desktop GUI through your browser directly from the Home Assistant sidebar.

## Installation

1. Navigate to **Settings → Add-ons → Add-on Store**.
2. Click the **⋮** menu (top right) and select **Repositories**.
3. Add this repository's GitHub URL and click **Add**.
4. Find **Calibre** in the store and click **Install**.

## Configuration

| Option | Default | Description |
|--------|---------|-------------|
| `puid` | `1000` | User ID the process runs as. Default works for most HA OS installs. |
| `pgid` | `1000` | Group ID the process runs as. Default works for most HA OS installs. |
| `timezone` | `America/Chicago` | Timezone in tz database format (e.g. `Europe/London`). |
| `password` | *(empty)* | Optional password to protect the GUI. |

## Ports

| Port | Purpose |
|------|---------|
| 8080 | Desktop GUI (HTTP) |
| 8181 | Desktop GUI (HTTPS) |
| 8081 | Calibre content server *(disabled by default)* |

## Library storage

Point your Calibre library to `/share/Calibre Library` on first launch so your books live in the Home Assistant `share` folder — accessible to other add-ons and persisted independently of this app.

## Credits

Docker image provided by [LinuxServer.io](https://linuxserver.io).
