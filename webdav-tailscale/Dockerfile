# Use the official Home Assistant add-on base image
FROM ghcr.io/hassio-addons/base:17.2.1

# Install required dependencies
RUN apk add --no-cache bash curl

# Install Tailscale using the official install script
RUN curl -fsSL https://tailscale.com/install.sh | sh

# Install WebDAV (hacdias/webdav)
RUN wget -qO- https://github.com/hacdias/webdav/releases/download/v3.6.0/webdav_linux_amd64.tar.gz \
  | tar xz -C /usr/local/bin/ && \
  chmod +x /usr/local/bin/webdav

# Copy our s6 service definitions into the image
COPY services/ /etc/services.d/

# Set workdir (optional but useful for debugging)
WORKDIR /share

# Start the container
CMD [ "/init" ]
