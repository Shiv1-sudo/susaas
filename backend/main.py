from fastapi import FastAPI, HTTPException
from pydantic import BaseModel, HttpUrl
from fastapi.responses import RedirectResponse
import os

app = FastAPI(title="SUSaaS - Secure URL Shortener as a Service")

url_db = {}

class URLRequest(BaseModel):
    long_url: HttpUrl

# Get BASE_URL from environment variable or fallback to localhost
BASE_URL = os.getenv("BASE_URL", "http://localhost:8000")

@app.post("/shorten")
def shorten_url(url_req: URLRequest):
    code = str(len(url_db) + 1).zfill(6)
    url_db[code] = url_req.long_url
    short_url = f"{BASE_URL}/{code}"
    return {"short_url": short_url}

@app.get("/{code}")
def redirect_to_long_url(code: str):
    long_url = url_db.get(code)
    if not long_url:
        raise HTTPException(status_code=404, detail="URL not found")
    return RedirectResponse(long_url)
