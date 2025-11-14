#!/bin/bash

echo "Starting MongoDB container..."

docker compose up -d database

echo "Starting FastAPI backend..."

if [ -z "$VIRTUAL_ENV" ]; then
    source backend/.venv/bin/activate
fi

uvicorn backend.main:app --reload --host 0.0.0.0 --port 8000 &

echo "Starting React frontend..."

npm start --prefix frontend
