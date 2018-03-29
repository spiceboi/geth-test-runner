# Geth Test Runner

Containerized geth client and test script runner using Docker, go-ethereum, and Javascript.

Docker Compose runs a geth client in dev mode, and exposes RPC and WebSocket endpoints, so linked services have access to geth on the `geth` host.

### Prerequisites

Docker, docker-compose

### Installing

You may need to make some scripts executable:

`chmod +x wait-for`

## Running the tests scripts in containers

`docker-compose up --build --abort-on-container-exit`

## Local Development

```
"scripts": {
    "start": "babel-node --presets=latest ./src/index.js",
    "dev": "nodemon --exec npm run babel-node -- ./src/index.js",
    "build": "babel src -d dist"
  },
```