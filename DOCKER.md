# Docker Setup for BeeNet

This guide explains how to run BeeNet server using Docker.

## Prerequisites

- Docker installed on your system
- Docker Compose (usually comes with Docker Desktop)

## Quick Start

### Using Docker Compose (Recommended)

1. Clone this repository or download the files
2. Navigate to the project directory
3. Run:
   ```bash
   docker compose up
   ```

4. The server will start and display logs showing it's online on port 8335

To run in detached mode (background):
```bash
docker compose up -d
```

To stop the server:
```bash
docker compose down
```

### Using Docker Directly

Build the image:
```bash
docker build -t beenet .
```

Run the container:
```bash
docker run -p 8335:8335 beenet
```

Run in detached mode:
```bash
docker run -d -p 8335:8335 --name beenet-server beenet
```

Stop the container:
```bash
docker stop beenet-server
docker rm beenet-server
```

## Port Forwarding

The server runs on port **8335** which is hardcoded in the APICO game client. This port is automatically exposed by the Docker container.

If you're running on a remote server or want to allow players from outside your network to connect, you'll need to:

1. Configure your firewall to allow incoming connections on port 8335
2. Set up port forwarding on your router (if running at home)
3. Players should use your public IP address as their Custom IP in-game

## Notes

- The Docker version runs the server in **headless mode** (no GUI)
- All server logs are output to the console
- The server uses built-in Node.js modules only (no npm dependencies needed)
- The container automatically restarts unless manually stopped (when using docker-compose)

## Troubleshooting

**Port already in use:**
If you get an error that port 8335 is already in use, make sure no other BeeNet server or application is using that port.

**Container won't start:**
Check the logs with:
```bash
docker logs beenet-server
```

Or when using docker-compose:
```bash
docker compose logs
```
