from pydantic import BaseModel, HttpUrl

class URLRequest(BaseModel):
    long_url: HttpUrl
