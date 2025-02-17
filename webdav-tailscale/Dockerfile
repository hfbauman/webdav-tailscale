# Use the official Home Assistant add-on base image
FROM ghcr.io/home-assistant/amd64-base:14.0

# Install required dependencies
RUN apk add --no-cache bash curl wget ca-certificates

# Install WebDAV (hacdias/webdav) v5.7.3
RUN wget -O /tmp/webdav.tar.gz https://github.com/hacdias/webdav/releases/download/v5.7.3/linux-amd64-webdav.tar.gz && \
    tar xzf /tmp/webdav.tar.gz -C /usr/local/bin/ && \
    rm /tmp/webdav.tar.gz && \
    chmod +x /usr/local/bin/webdav

# Copy our s6 service definitions into the image
COPY services/ /etc/services.d/

# Ensure correct permissions for service scripts
RUN chmod -R +x /etc/services.d/

# Set workdir (optional but useful for debugging)
WORKDIR /share

# Ensure s6-overlay runs as PID 1
ENTRYPOINT [ "/init" ]

# CMD must be an empty array (required for Home Assistant)
CMD []
