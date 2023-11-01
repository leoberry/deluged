# deluged
Include deluged &amp; deluge-web based on debian Trixie

Example of docker-compose file : 

````yaml
version: '3'
services:
  deluged21:
    build: .
    container_name: deluged21
    network_mode: service:wireguard21
    volumes:
      - ./Docker/config/deluge:/root/.config/deluge # To override default configuration
    restart: unless-stopped
```
