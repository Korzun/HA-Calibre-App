#!/bin/bash
set -e

CONFIG=/data/options.json

# Read user options and export as environment variables expected by linuxserver/calibre
export PUID
export PGID
export TZ
export PASSWORD

PUID=$(jq -r '.puid // 1000' "${CONFIG}")
PGID=$(jq -r '.pgid // 1000' "${CONFIG}")
TZ=$(jq -r '.timezone // "UTC"' "${CONFIG}")
PASSWORD=$(jq -r '.password // empty' "${CONFIG}")

# Persist the linuxserver /config directory to /data so the Calibre library
# and settings survive add-on restarts and updates.
mkdir -p /data/lsio-config
if [ -d /config ] && [ ! -L /config ]; then
    # First run: seed persistent storage with any defaults linuxserver ships.
    cp -rn /config/. /data/lsio-config/ 2>/dev/null || true
    rm -rf /config
fi
ln -sfn /data/lsio-config /config

# Hand off to the linuxserver s6-overlay init system.
exec /init
