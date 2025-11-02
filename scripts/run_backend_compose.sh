#!/bin/bash

echo "Running backend and database via Docker Compose..."

docker rm -f 3-tier-app-database 2>/dev/null
docker compose up -d backend database
