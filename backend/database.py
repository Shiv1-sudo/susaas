import os
from motor.motor_asyncio import AsyncIOMotorClient
from dotenv import load_dotenv
from pathlib import Path

# Load from root .env
load_dotenv(dotenv_path=Path(__file__).resolve().parents[1] / ".env")

MONGO_URI = os.getenv("COSMOS_CONNECTION_STRING")
DB_NAME = os.getenv("DATABASE_NAME")
COLLECTION_NAME = os.getenv("COLLECTION_NAME")

print("MONGO_URI =", repr(MONGO_URI))
client = AsyncIOMotorClient(MONGO_URI)
db = client[DB_NAME]
url_collection = db[COLLECTION_NAME]
