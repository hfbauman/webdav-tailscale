# Use the official Home Assistant add-on base image
FROM ghcr.io/home-assistant/addon-base:3.21

# Install required packages
RUN apk add --no-cache wget tar bash

# -------------------------------
# Install Tailscale
# -------------------------------
# (Adjust the version and URL as needed)
RUN wget -qO- https://pkgs.tailscale.com/stable/tailscale_1.50.0_amd64.tgz \
  | tar xz -C /tmp && \
  mv /tmp/tailscaled /tmp/tailscale /usr/local/bin/ && \
  chmod +x /usr/local/bin/tailscaled /usr/local/bin/tailscale

# -------------------------------
# Install WebDAV (hacdias/webdav)
# -------------------------------
# (Adjust the version and URL as needed)
RUN wget -qO- https://github.com/hacdias/webdav/releases/download/v3.6.0/webdav_linux_amd64.tar.gz \
  | tar xz -C /tmp && \
  mv /tmp/webdav /usr/local/bin/webdav && \
  chmod +x /usr/local/bin/webdav

# Copy our s6 service definitions into the image
COPY services/ /etc/services.d/
