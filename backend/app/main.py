from fastapi import FastAPI
from app.routes.detect import router as detect_router

app = FastAPI()

app.include_router(detect_router)

@app.get("/")
def home():
    return {"status": "API running"}