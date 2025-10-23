#!/bin/bash 

echo "Starting MongoDB..."

brew services start mongodb-community@7.0

echo "Starting FastAPI..." 

if [ -z "$VIRTUAL_ENV" ]; then
    source backend/.venv/bin/activate
fi

uvicorn backend.main:app --reload --host 0.0.0.0 --port 8000 &

echo "Starting React frontend..." 

npm start --prefix frontend