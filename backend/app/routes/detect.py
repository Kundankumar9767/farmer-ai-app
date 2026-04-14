from fastapi import APIRouter, UploadFile, File
from app.services.disease import predict_disease

router = APIRouter()

@router.post("/detect")
async def detect(file: UploadFile = File(...)):
    contents = await file.read()

    disease, treatment = predict_disease(contents)

    return {
        "message": f"आपके पौधे में {disease} है। इलाज: {treatment}"
    }