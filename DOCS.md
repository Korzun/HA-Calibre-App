# Calibre Add-on for Home Assistant

Runs [Calibre](https://calibre-ebook.com) — a powerful e-book management application — as a Home Assistant app using the [LinuxServer.io Docker image](https://hub.docker.com/r/linuxserver/calibre).

Access the full Calibre desktop GUI through your browser via the web UI link on the add-on page.

## First-time setup

1. Set your **Timezone** to your local tz (e.g. `America/Chicago`).
2. Set **PUID** / **PGID** to match the user that owns your e-book files. Default `1000` works for most Home Assistant OS setups. If you have the SSH & Web Terminal add-on, you can run `id` to confirm.
3. Optionally set a **GUI Password** to protect the interface.
4. Start the add-on and open the Web UI.
5. On first launch, Calibre will ask you where your library lives. Point it to `/share/Calibre Library` (or any path under `/share`) so your books are stored in the Home Assistant `share` folder and accessible to other add-ons.

## Ports

| Port | Purpose |
|------|---------|
| 8080 | Desktop GUI over HTTP |
| 8181 | Desktop GUI over HTTPS |
| 8081 | Calibre built-in content server (disabled by default — enable in *Calibre Preferences → Sharing → Content server*) |

## Persistent data

Calibre config and library metadata are stored in the add-on's `/data` directory, which persists across restarts and updates. Your actual book files should live under `/share` so they are not tied to this add-on's lifecycle.

## Notes

- HTTPS (port 8181) is recommended for modern browser features (clipboard, file access). Port 8080 is available as a fallback.
- For a shared-memory recommendation (`--shm-size="1gb"`), configure this through the Home Assistant Supervisor if needed.
- To enable the built-in Calibre content server on port 8081, go to *Preferences → Sharing → Content server* inside the Calibre GUI, start the server, then enable port 8081 in the add-on configuration.
