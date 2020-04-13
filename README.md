# Nginx WebDav Server (built from the official Nginx/Debian-Buster docker image)

Incredibly secure, fast and light WebDav Server, built from Nginx official image - bare minimum with no bells and whistles.

## How to use this image
```console
$ docker run --name keepass-webdav -p 80:80 -v /path/to/your/keepass/files/:/media/ -d maltokyo/docker-nginx-webdav
```

Or use the docker-compose file included in this repository.

No built-in TLS support. Reverse proxy with TLS recommended

## Volumes
- `/media` - served directory

## Authentication
To restrict access to only authorized users (recommended), you can define two environment variables: `$USERNAME` and `$PASSWORD`
```console
$ docker run --name webdav -p 80:80 -v /path/to/your/shared/files/:/media/ -e USERNAME=webdav -e PASSWORD=webdav -d maltokyo/docker-nginx-webdav

```

(Inspired from https://github.com/jbbodart/alpine-nginx-webdav - but "upgraded" to debian-buster image with all WebDav functionality enabled to work perfectly with MacOS OSX and Windows 10)