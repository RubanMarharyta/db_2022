from typing import List

from fastapi import Depends, HTTPException
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy.sql import text

from database import db
from models import Client


class CrudService:
    def __init__(self, session: AsyncSession = Depends(db.get_session)):
        self._session = session

    async def get_by_id(self, id: int) -> Client:
        query = text("""SELECT * FROM client WHERE id=:id""")
        result = await self._session.execute(query, {"id": id})
        model = result.one_or_none()
        if not model:
            raise HTTPException(status_code=404, detail="Client not found.")
        return Client(
            id=model[0],
            name=model[1],
            surname=model[2],
            email=model[3],
            phone=model[4],
        )

    async def get_all(self) -> List[Client]:
        query = text("""SELECT id, name, surname, email, phone FROM client""")
        result = await self._session.execute(query)
        models = []
        for row in result.all():
            client = Client(
                id=row[0],
                name=row[1],
                surname=row[2],
                email=row[3],
                phone=row[4],
            )
            models.append(client)
        return models

    async def create(self, request: Client) -> None:
        query = text("""INSERT INTO client (name, surname, email, phone) VALUES (:name, :surname, :email, :phone)""")
        result = await self._session.execute(query, request.dict())
        await self._session.commit()

    async def update(self, id: int, request: Client) -> None:
        query = text("""UPDATE client SET name=:name, surname=:surname, email=:email, phone=:phone WHERE id=:id""")
        params = {"id": id}
        params.update(request.dict())
        result = await self._session.execute(query, params)
        await self._session.commit()

    async def delete(self, id: int) -> None:
        query = text("""DELETE FROM client WHERE id=:id""")
        result = await self._session.execute(query, {"id": id})
        await self._session.commit()
