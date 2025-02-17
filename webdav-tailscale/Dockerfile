# Use the official Home Assistant add-on base image
FROM ghcr.io/hassio-addons/base/amd64:17.2.1

# Install required dependencies
RUN apk add --no-cache bash curl wget ca-certificates

# Install WebDAV (hacdias/webdav) v5.7.3
RUN wget -O /tmp/webdav.tar.gz https://github.com/hacdias/webdav/releases/download/v5.7.3/linux-amd64-webdav.tar.gz && \
    tar xzf /tmp/webdav.tar.gz -C /usr/local/bin/ && \
    rm /tmp/webdav.tar.gz && \
    chmod +x /usr/local/bin/webdav

# Install Tailscale
RUN apk add --no-cache tailscale

# Copy the startup script
COPY run.sh /run.sh
RUN chmod +x /run.sh

# Set the working directory
WORKDIR /share

# Define the entrypoint script
CMD [ "/run.sh" ]
