# VNC-iPad
A Lightweight, Ready-to-Use Web Browsing Environment in Docker with VNC Access

## Info :information_source:
VNC-ipad is a minimal Docker image designed to provide a lightweight environment for browsing the web via VNC.
This Docker image encapsulates a lightweight, VNC-accessible Chromium web browser starting in kiosk mode.
It allows to use old iPad as a remote for home assistant (native outdated safari browser of old ipad is unusable for this purporse).
You should install any vnc viewer on ipad (available on all versions of ipad)

**Key Features ✨**

- **VNC-Ready**: Ready for use with any VNC client or through a web browser using noVNC, offering a user-friendly interface.
- **Lightweight**: Built on Alpine Linux and Debian Slim, ensuring minimal resource usage.
- **Customizable**: Set VNC password, initial website URL, auto-start settings for the browser and xterm via environment variables.
- **Accessible**: Access the VNC server directly or through a browser using noVNC.

## Quick Start 🚀
You can run it easily using its default or by passing the appropriate environment variables.

- ### Docker CLI 🐳
  ```bash
  docker run -d -p 5900:5900 --name vnc-ipad -e VNC_PASSWORD="mypassword" -e STARTING_WEBSITE_URL="HOMEASSISTANT_IP:8123" ddayb/vnc-ipad
  ```

- ### Docker Compose 🐳
  ```yaml
  services:
    vnc-ipad:
      container_name: vnc-ipad
      image: ddayb/vnc-ipad
      ports:
        - "5900:5900"
      environment:
        VNC_PASSWORD: "mypassword"
        STARTING_WEBSITE_URL: "HOMEASSISTANT_IP:8123"
      restart: unless-stopped
    ```

## Customization 🎨
You can customize the settings of the Docker container by passing environment variables during the Docker run command. All the current settings will be printed in the container logs. Here are some examples:

### All available variables ⚙️
- `VNC_RESOLUTION` (default: `1024x768`): Resolution of the VNC display.
- `VNC_PASSWORD` (default: `password`): Password for VNC access.
- `VNC_PORT` (default: `5900`): Port for VNC connections.
- `STARTING_WEBSITE_URL` (default: `http://192.168.3.3:8123/dashboard-tablet/ipad`): Initial website URL opened in the browser.

- Example:
```sh
docker run -d -p 5900:5900 -e STARTING_WEBSITE_URL="https://www.google.com" -e VNC_PASSWORD="mypassword" -e VNC_RESOLUTION="1920x1080" -e ddayb/vnc-ipad```

---

### :warning: Disclaimer
This project and its artifacts are provided "as is" and without warranty of any kind.
The author makes no warranties, express or implied, that this script is free of errors, defects, or suitable for any particular purpose.
The author shall not be retained liable for any damages suffered by any user of this script, whether direct, indirect, incidental, consequential, or special, arising from the use of or inability to use this script or its documentation, even if the author has been advised of the possibility of such damages.

## :hash: License
[GPL 3.0](https://www.gnu.org/licenses/gpl-3.0.html)