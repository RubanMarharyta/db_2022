from sqlmodel import SQLModel, Field


class Result(SQLModel):
    status: str


class Client(SQLModel, table=True):
    __tablename__ = "client"

    id: int = Field(primary_key=True)
    name: str = Field()
    surname: str = Field()
    email: str = Field()
    phone: str = Field()