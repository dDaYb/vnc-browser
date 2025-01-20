# VNC-iPad
Give your old iPad a new life as a remote for home assistant!

## Info ℹ️
Old iPads come with an outdated version of Safari, which makes them unusable with modern Home Assistant dashboards.

**VNC-iPad** enables you to use your old iPad as a remote for Home Assistant. The outdated Safari browser on old iPads is not suitable for this purpose.

## Quick Start 🚀
1. Install any VNC viewer on the iPad (available for all iPad versions)
2. Start this docker container (see bellow)
3. Point your VNC viewer on iPad to container_ip:5900

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
docker run -d -p 5900:5900 -e STARTING_WEBSITE_URL="https://www.google.com" -e VNC_PASSWORD="mypassword" -e VNC_RESOLUTION="1920x1080" -e ddayb/vnc-ipad
```

### :warning: Disclaimer
This project and its artifacts are provided "as is" and without warranty of any kind.
The author makes no warranties, express or implied, that this script is free of errors, defects, or suitable for any particular purpose.
The author shall not be retained liable for any damages suffered by any user of this script, whether direct, indirect, incidental, consequential, or special, arising from the use of or inability to use this script or its documentation, even if the author has been advised of the possibility of such damages.

## :hash: License
[GPL 3.0](https://www.gnu.org/licenses/gpl-3.0.html)
