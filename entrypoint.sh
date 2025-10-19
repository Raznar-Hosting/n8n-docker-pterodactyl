#!/bin/sh

# Setup environment variables dengan prioritas yang jelas
export N8N_PORT="${SERVER_PORT}"
export N8N_HOST="${N8N_HOST:-0.0.0.0}"
export N8N_USER_FOLDER="/home/container/.n8n"
mkdir -p "$N8N_USER_FOLDER"
chmod 750 "$N8N_USER_FOLDER"

export N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true
export N8N_RUNNERS_ENABLED=true
export N8N_DIAGNOSTICS_ENABLED=true
export NODE_OPTIONS="--max-old-space-size=4096 --unhandled-rejections=strict"

export PATH="$PATH:/usr/local/bin"

exec n8n start