# Geth Test Runner

Containerized geth client and test script runner using Docker, go-ethereum, and Javascript.

Docker Compose runs a geth client in dev mode, and exposes RPC and WebSocket endpoints, so linked services have access to geth on the `geth` host.

### Prerequisites

Docker, docker-compose, Node

### Installing

You may need to make this script executable:

`chmod +x wait-for`

## Running with docker-compose

`docker-compose up --build --abort-on-container-exit`

## Local Development

Requires local eth client up and running.

```
"scripts": {
    "start": "babel-node --presets=latest ./src/index.js",
    "dev": "nodemon --exec npm run babel-node -- ./src/index.js",
    "build": "babel src -d dist"
  },
```

## Building Docker Image

`docker build -t geth-test-runner:latest .`

## Running Docker Image

`docker run -e "GETH_HOST=localhost" geth-test-runner:latest`