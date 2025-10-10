#!/bin/bash 

echo "Starting MongoDB..."

brew services start mongodb-community@7.0

echo "Starting FastAPI..." 

cd backend && uvicorn main:app --reload --host 0.0.0.0 --port 8000 &

echo "Starting React frontend..." 

cd frontend && npm start