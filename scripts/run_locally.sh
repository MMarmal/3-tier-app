#!/bin/bash

echo "Starting MongoDB container..."

# '2>/dev/null' hides any error message (for example, if the container doesn't exist).
docker rm -f 3-tier-app-database 2>/dev/null 

docker run -d \
  --name 3-tier-app-database \
  -p 27017:27017 \
  -v "$(pwd)/mongo_data:/data/db" \
  mongo:8.0


echo "Starting FastAPI backend..."

if [ -z "$VIRTUAL_ENV" ]; then
    source backend/.venv/bin/activate
fi

uvicorn backend.main:app --reload --host 0.0.0.0 --port 8000 &

echo "Starting React frontend..."

npm start --prefix frontend
