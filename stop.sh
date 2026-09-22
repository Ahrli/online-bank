#!/bin/bash

set -e

COMPOSE_FILE="deploy/docker-compose.nginx.yml"

echo "Stopping and removing the compose stack..."
docker compose -f "$COMPOSE_FILE" down

echo "Compose stack stopped."
