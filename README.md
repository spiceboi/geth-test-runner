# Geth Test Runner

Containerized geth client and test script runner using Docker and go-ethereum.

Docker Compose runs a geth client in dev mode, and exposes RPC endpoints, so scripts can either use the `geth` cli or RPC payloads. When all scripts have run, the cluster spins down.

### Prerequisites

Docker, docker-compose

### Installing

You may need to make some scripts executable:

`chmod +x run-scripts wait-for scripts/*`

## Running the tests scripts

`docker-compose up --build --abort-on-container-exit`
