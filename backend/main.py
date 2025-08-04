from fastapi import FastAPI, HTTPException
from fastapi.responses import RedirectResponse
from models import URLRequest
from database import url_collection
import os
import hashlib
from dotenv import load_dotenv  # NEW

load_dotenv()  # NEW

app = FastAPI(title="SUSaaS - Secure URL Shortener as a Service")

BASE_URL = os.getenv("BASE_URL", "http://localhost:8000")

# Add this endpoint # NEW
@app.get("/health")
async def health_check():
    return {"status": "ok"}

def generate_code(long_url) -> str:
    return hashlib.md5(str(long_url).encode()).hexdigest()[:6]

@app.post("/shorten")
async def shorten_url(url_req: URLRequest):
    code = generate_code(url_req.long_url)
    print(f"Generated code for URL: {code}")

    try:
        existing = await url_collection.find_one({"code": code})
        if existing:
            print("Found existing short URL")
            return {"short_url": f"{BASE_URL}/{code}"}

        await url_collection.insert_one({
            "code": code,
            "long_url": str(url_req.long_url)  # cast to string here!
        })
        print("New URL inserted into database")
        return {"short_url": f"{BASE_URL}/{code}"}

    except Exception as e:
        print(f"DATABASE ERROR in shorten_url: {repr(e)}")
        raise HTTPException(status_code=500, detail="Failed to shorten URL")

@app.get("/{code}")
async def redirect_to_long_url(code: str):
    print(f"Attempting redirect for code: {code}")
    try:
        result = await url_collection.find_one({"code": code})
        if not result:
            raise HTTPException(status_code=404, detail="URL not found")

        print(f"Redirecting to: {result['long_url']}")
        return RedirectResponse(result["long_url"])

    except Exception as e:
        print(f"DATABASE ERROR in redirect_to_long_url: {repr(e)}")
        raise HTTPException(status_code=500, detail="Failed to fetch original URL")
