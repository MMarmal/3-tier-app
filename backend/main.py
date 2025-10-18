from fastapi import FastAPI, Request
from pymongo import MongoClient
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

MONGO_URI = os.getenv("MONGO_URI", "mongodb://localhost:27017/")
client = MongoClient(MONGO_URI)
db = client["testdb"]
collection = db["users"]

@app.get("/users")
def get_users():
         users = list(collection.find({}, {"_id": 0}))
         return {"users": users}


@app.post("/users")
async def add_user(request: Request):
    data = await request.json()
    name = data.get("name")
    if not name:
        return {"error": "Name field is required"}
    
    collection.insert_one({"name": name})
    return {"message": f"User '{name}' added successfully"}
