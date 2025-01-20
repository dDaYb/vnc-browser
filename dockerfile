# Use a minimal base image
FROM debian:stable-slim

LABEL version="1.0.0"
LABEL org.opencontainers.image.title="Vnc browser for old ipad"
LABEL org.opencontainers.image.description="Docker image with browser to use old ipad as homeassistant remote"

# Build arguments to set environment variables at build time
ARG DEF_VNC_RESOLUTION=1024x768
ARG DEF_VNC_PASSWORD=password
ARG DEF_VNC_PORT=5900
ARG DEF_STARTING_WEBSITE_URL="http://192.168.3.3:8123/dashboard-tablet/ipad"
ARG DEF_DEBIAN_FRONTEND=noninteractive

# Set environment variables with default values
ENV VNC_RESOLUTION=${DEF_VNC_RESOLUTION} \
    DISPLAY=:0.0 \
    VNC_PASSWORD=${DEF_VNC_PASSWORD} \
    VNC_PORT=${DEF_VNC_PORT} \
    STARTING_WEBSITE_URL=${DEF_STARTING_WEBSITE_URL} \
    DEBIAN_FRONTEND=${DEF_DEBIAN_FRONTEND} 

# Install necessary packages and setup noVNC
RUN set -e; \
    apt update && \
    apt full-upgrade -qqy && \
    apt install -qqy \
    tini \
    supervisor \
    bash \
    xvfb \
    x11vnc \
    fluxbox \
    chromium && \
    apt autoremove --purge -y && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

# Create necessary directories for supervisor and custom entrypoints
RUN mkdir -p /etc/supervisor.d /app/conf.d 
RUN mkdir -p /var/log/supervisor

# Copy configuration files
COPY supervisord.conf /etc/supervisor.d/supervisord.conf
COPY conf.d/ /app/conf.d/
COPY base_entrypoint.sh /usr/local/bin/

# Make the entrypoint scripts executable
RUN chmod +x /usr/local/bin/base_entrypoint.sh

# Expose the standard VNC and noVNC ports
EXPOSE ${VNC_PORT}

# Set tini as the entrypoint and the custom script as the command
ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["/usr/local/bin/base_entrypoint.sh"]
