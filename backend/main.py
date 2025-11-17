from fastapi import FastAPI
from pymongo import MongoClient
from pydantic import BaseModel
from fastapi.middleware.cors import CORSMiddleware
import os

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:3000"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

def read_secret(secret_name):
    try:
        with open(f'/run/secrets/{secret_name}', 'r') as f:
            return f.read().strip()
    except FileNotFoundError:
        return None

MONGO_USERNAME = read_secret('mongo_user')
MONGO_PASSWORD = read_secret('mongo_password')

if MONGO_USERNAME and MONGO_PASSWORD:
    MONGO_URI = f"mongodb://{MONGO_USERNAME}:{MONGO_PASSWORD}@database:27017/"
else:
    MONGO_URI = "mongodb://localhost:27017/"

client = MongoClient(MONGO_URI)
db = client["testdb"]
collection = db["users"]


class User(BaseModel):
    name: str



@app.get("/users")
def get_users():
         users = list(collection.find({}, {"_id": 0}))
         return {"users": users}


@app.post("/users")
async def add_user(user: User):
    collection.insert_one(user.dict())
    return {"message": f"User '{user.name}' added successfully"}
