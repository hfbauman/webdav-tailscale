#!/bin/sh

# Start Tailscale in userspace mode
tailscaled --tun=userspace-networking &

# Authenticate with Tailscale (replace with your auth key)
tailscale up --authkey=${TAILSCALE_AUTHKEY} --hostname=home-assistant-webdav

# Start WebDAV on port 8080
exec /usr/local/bin/webdav -p 8080
