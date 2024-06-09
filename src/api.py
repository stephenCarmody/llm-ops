from fastapi import APIRouter, FastAPI

router = APIRouter()

app = FastAPI()


@router.get("/")
async def root():
    return "hello world"


@router.get("/ping")
async def ping():
    return "pong"

app.include_router(router)
