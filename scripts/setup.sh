#!/bin/bash

cd backend
python3 -m venv .venv
source .venv/bin/activate
pip3 install -r requirements.txt

cd ../frontend
npm install

echo "All dependencies installed!"
echo "Your virtual environment is ready."