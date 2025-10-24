#!/bin/bash

echo "Starting MongoDB container..."

# Run MongoDB in Docker if not already running
if [ ! "$(docker ps -q -f name=mongodb)" ]; then
    if [ "$(docker ps -aq -f status=exited -f name=mongodb)" ]; then
        # Remove the old container if it exists but is stopped
        docker rm mongodb > /dev/null 2>&1
    fi
    docker run -d \
        --name mongodb \
        -p 27017:27017 \
        -v "$(pwd)/mongo_data:/data/db" \
        mongo:8.0
else
    echo "MongoDB container already running."
fi

echo "Starting FastAPI backend..."

if [ -z "$VIRTUAL_ENV" ]; then
    source backend/.venv/bin/activate
fi

uvicorn backend.main:app --reload --host 0.0.0.0 --port 8000 &

echo "Starting React frontend..."

npm start --prefix frontend
