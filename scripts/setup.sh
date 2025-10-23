#!/bin/bash

python3 -m venv backend/.venv
source backend/.venv/bin/activate

pip install -r backend/requirements.txt

npm install --prefix frontend

echo "All dependencies installed!"
echo "Your virtual environment is ready."