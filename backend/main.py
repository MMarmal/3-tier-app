from fastapi import FastAPI, Request
from pymongo import MongoClient
from pydantic import BaseModel
from fastapi.middleware.cors import CORSMiddleware
import os

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

MONGO_URI = os.getenv("MONGO_URI", "mongodb://localhost:27017/")
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
