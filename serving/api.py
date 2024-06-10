from fastapi import APIRouter, FastAPI, Response
import numpy as np
import json

router = APIRouter()

app = FastAPI()


@router.get("/")
async def root():
    return "hello world"


@router.get("/ping")
async def ping():
    return "pong"

@router.post("/inference")
async def ping():
    output = {"predictions": np.array([0.1, 0.2, 0.3]).tolist()}
    return Response(json.dumps(output))


app.include_router(router)
