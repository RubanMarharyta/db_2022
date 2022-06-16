from sqlalchemy.ext.asyncio import create_async_engine, AsyncSession
from sqlalchemy.orm import sessionmaker
from sqlmodel import SQLModel

SQLALCHEMY_DATABASE_URI = "postgresql+asyncpg://bfhmrvpe:qsIVnIITOHDn92sM7_Xsj3ek0Ey767gY@abul.db.elephantsql.com/bfhmrvpe"


class Database:
    def __init__(self):
        self.db_uri = SQLALCHEMY_DATABASE_URI
        self.engine = create_async_engine(self.db_uri, echo=False, future=True)
        self.async_session = sessionmaker(self.engine, class_=AsyncSession, expire_on_commit=False)

    def close_engine(self):
        """
        For lifecycle shutdown
        """
        self.engine.dispose()

    async def ensure_created(self):
        """
        WARNING!!!
        Be careful when using this method!
        It drops ALL your DB and creates it again!
        """
        async with self.engine.begin() as conn:
            # await conn.run_sync(SQLModel.metadata.drop_all)
            await conn.run_sync(SQLModel.metadata.create_all)

    async def get_session(self) -> AsyncSession:
        async with self.async_session() as session:
            try:
                yield session
            except Exception as ex:
                print("Database session error occurred", ex)
                await session.rollback()
                raise
            finally:
                await session.close()


db = Database()
