# Use the official Home Assistant add-on base image
FROM ghcr.io/hassio-addons/base:17.2.1

# Install required dependencies
RUN apk add --no-cache bash curl tailscale

# Install WebDAV (hacdias/webdav) with verification
RUN wget -O /tmp/webdav.tar.gz https://github.com/hacdias/webdav/releases/download/v3.6.0/webdav_linux_amd64.tar.gz && \
    tar xzf /tmp/webdav.tar.gz -C /usr/local/bin/ && \
    rm /tmp/webdav.tar.gz && \
    chmod +x /usr/local/bin/webdav

# Copy our s6 service definitions into the image
COPY services/ /etc/services.d/

# Ensure correct permissions for service scripts
RUN chmod -R +x /etc/services.d/

# Set workdir (optional but useful for debugging)
WORKDIR /share

# Start the container
CMD [ "/init" ]
