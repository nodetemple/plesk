# Dockerfile for Plesk

Run Plesk in Docker container.

## Build and run

Build an image manually:
```bash
docker build -t nodetemple/plesk:17.0 https://github.com/nodetemple/plesk.git#master:17.0
```

Run a container:
```bash
docker run -d -it --name=plesk --privileged -p 8880:8880 -p 8447:8447 nodetemple/plesk:17.0
```

## Access control panel

- Open YOUR-IP-OR-DOMAIN:8880 URL using a browser.
- Default login and password: admin / nodetemple
