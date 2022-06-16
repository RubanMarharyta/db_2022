from typing import List

from fastapi import FastAPI, Depends
from starlette.responses import Response

from crud import CrudService
from database import db
from models import Client, Result

app = FastAPI()


@app.on_event("startup")
async def on_startup():
    await db.ensure_created()


@app.get("/client/{id}", response_model=Client)
async def get_client_by_id(id: int, crud: CrudService = Depends()):
    return await crud.get_by_id(id)


@app.get("/client", response_model=List[Client])
async def get_list_of_all_client(crud: CrudService = Depends()):
    return await crud.get_all()


@app.post("/client", response_model=Result)
async def create(model: Client, crud: CrudService = Depends()):
    await crud.create(model)
    return Result(status="Client created successfully.")


@app.put("/client/{id}", response_model=Result)
async def update_client_by_id(id: int, model: Client, crud: CrudService = Depends()):
    await crud.update(id, model)
    return Result(status="Client updated successfully.")


@app.delete("/client/{id}", response_model=Result)
async def delete_client_by_id(id: int, crud: CrudService = Depends()):
    await crud.delete(id)
    return Result(status="Client deleted successfully.")
