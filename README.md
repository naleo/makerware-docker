# docker-makerbot-desktop
A docker image that runs [Makerbot Desktop](https://www.makerbot.com/desktop).

## Install
### From the Git repository
```bash
$ git clone https://github.com/HiroakiMikami/docker-makerbot-desktop
$ docker build -t docker-makerbot-desktop ./docker-makerbot-desktop
```

### From DockerHub
```bash
$ docker pull hiroakimikami/docker-makerbot-desktop
```

## Usage
The following command will:

1. share the display settings with the host (`-e DISPLAY=$DISPLAY`),
2. share the devices with the host in order to connect to the 3D printer (`-v /dev/:/dev/`),
3. mount `~/makerbot` into `${HOME}` within the container (`-v ${HOME}/makerbot:/home/makerbot`), and
4. run `makerware` and its backend service.

```bash
$ docker run -ti -e DISPLAY=$DISPLAY \
                 -v /tmp/.X11-unix:/tmp/.X11-unix \
                 -v /dev/:/dev/ \
                 -v ${HOME}/makerbot:/home/makerbot
                 docker-makerbot-desktop
```

## Troubleshooting
### The application failed with the error message: `No protocol specified`
Please try the following command.

```bash
$ xhost local:root
```

## LICNSE
This software is released under the MIT License, see LICENSE.md.
