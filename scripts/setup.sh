#!/bin/bash

cd backend
pip3 install -r requirements.txt

cd ../frontend
npm install

echo "All dependencies installed!"