FROM nginx:latest

LABEL maintainer="maltokyo"

RUN apt-get update && apt-get dist-upgrade -y && apt-get install -y nginx-extras apache2-utils

VOLUME /media
EXPOSE 80
COPY webdav.conf /etc/nginx/conf.d/default.conf
RUN rm /etc/nginx/sites-enabled/*

COPY entrypoint.sh /
RUN chmod +x entrypoint.sh
CMD /entrypoint.sh && nginx -g "daemon off;"