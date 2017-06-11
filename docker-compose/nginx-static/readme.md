# NGINX Static Content

_Docker configuration for development to serve local static files with NGINX and disable caching._


```
version: '3'
services:
  nginx:
    image: nginx:alpine
    volumes:
      # Configuration
      - ./config/nginx.conf:/etc/nginx/nginx.conf:ro
        # Website Directory
      - ./www:/var/www:ro
      # Logs
      - ./log:/var/log/nginx
    ports:
      - "127.0.0.1:3000:80"
    command: [nginx-debug, '-g', 'daemon off;']
```

## Local

- Port: `127.0.0.1:3000`
- Webfolder: `./www`
- Logs: `./logs`
- Config: `./config`

## Container Information

- Environment: `Development`
- Caching: `disabled`
- Port: `80`
- Webfolder: `/var/www`
- Logs: `/var/log/nginx`

