#!/bin/bash

set -e

COMPOSE_FILE="deploy/docker-compose.nginx.yml"
JAR_FILE="target/online-bank-0.0.1-SNAPSHOT.jar"

if [ ! -f "$JAR_FILE" ]; then
    echo "Missing $JAR_FILE"
    echo "Build the jar once with: mvn package -DskipTests"
    exit 1
fi

echo "Starting MySQL, application, and Nginx..."
docker compose -f "$COMPOSE_FILE" up -d

echo "Application is available at: http://localhost/online-bank/"
