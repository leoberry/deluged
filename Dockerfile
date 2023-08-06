# Smallest base image
FROM debian:trixie

LABEL maintainer="Léo Berry <mail@leo-berry.fr>"

## Install Packages
RUN apt update && apt install -y supervisor deluged deluge-web curl

## CLEAR TMP FILES
RUN rm -rf /tmp/* /var/tmp/* /var/cache/apt/*

## Create DIR
RUN mkdir -p /var/log/supervisor

## Copy Configs
COPY ./etc/supervisord.conf /etc/supervisord.conf
COPY ./etc/supervisor.d /etc/supervisor.d

## SSH
EXPOSE 8112 58846 53160


ENTRYPOINT ["/usr/bin/supervisord", "--nodaemon", "--configuration", "/etc/supervisord.conf"]
