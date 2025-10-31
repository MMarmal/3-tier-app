#!/bin/bash
docker rm -f 3-tier-app-database 2>/dev/null
docker compose up -d
