# Nginx WebDav Server (built from the official Nginx/Debian-Buster docker image)

Incredibly secure, fast and light WebDav Server, built from Nginx official image - bare minimum with no bells and whistles.

## How to use this image
```console
$ docker run --name keepass-webdav -p 80:80 -v /path/to/your/keepass/files/:/media/data -d maltokyo/docker-nginx-webdav
```

Or use the [docker-compose](./docker-compose.yml) file included in this repository.

No built-in TLS support. Reverse proxy with TLS recommended

## Volumes
- `/media/data` - served directory

## Authentication
To restrict access to only authorized users (recommended), you can define two environment variables: `$USERNAME` and `$PASSWORD`
```console
$ docker run --name webdav -p 80:80 -v /path/to/your/shared/files/:/media/data -e USERNAME=webdav -e PASSWORD=webdav -d maltokyo/docker-nginx-webdav

```
Or use docker-compose example with secret
```nano
version: "3.9"
name: webdav
secrets:
  USERNAME_SC:
    file: <path-to-your-secret>/username.secret.txt
  PASSWORD_SC:
    file:  <path-to-your-secret>/password.secret.txt
services:
  docker-nginx-webdav:
    #image: djonko/docker-nginx-webdav
    build: .
    container_name: webdav
    restart: unless-stopped
    security_opt:
      - no-new-privileges:true
    ports:
      - "80:80"
    volumes:
      - "<path-you-want-to-share>:/media/data"
    secrets:
      - USERNAME_SC
      - PASSWORD_SC
    environment:
      - USERNAME_FILE=/run/secrets/USERNAME_SC
      - PASSWORD_FILE=/run/secrets/PASSWORD_SC

```

(Inspired from https://github.com/jbbodart/alpine-nginx-webdav - but "upgraded" to debian-buster image with all WebDav functionality enabled to work perfectly with MacOS OSX and Windows 10)
