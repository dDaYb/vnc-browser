#!/usr/bin/env bash
set -e

# Print current VNC info
echo "Current VNC info:"
echo "-----------------"
echo "VNC resolution: ${VNC_RESOLUTION}"
echo "VNC password: ${VNC_PASSWORD}"
echo "VNC Port: ${VNC_PORT}"
echo "Homepage website URL: ${STARTING_WEBSITE_URL}"

# Start Supervisor
exec supervisord -c /etc/supervisor.d/supervisord.conf