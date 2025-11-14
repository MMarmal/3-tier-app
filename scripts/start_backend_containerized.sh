#!/bin/bash

echo "Running backend and database via Docker Compose..."

docker compose up -d backend database
