from fastapi import APIRouter
from conn import conn
from model.saloon import Saloon

saloon_router = APIRouter(
    prefix="/saloon",
    tags=["saloon"],
)

@saloon_router.get("/")
async def read_items(attr: list, where: dict):
    cursor = conn.cursor()
    sql = Saloon.querySql(attr=attr, where=where)
    cursor.execute(sql)

    lines = cursor.fetchall()

    return {'values': lines}

@saloon_router.post("/")
async def insert_item(saloon: Saloon):
    cursor = conn.cursor()
    sql = saloon.insertSql()
    cursor.execute(sql)
    conn.commit()

    return {'added':saloon}

@saloon_router.delete("/")
async def delete_item(where: dict):
    cursor = conn.cursor()
    sql = Saloon.deleteSql(where=where)
    cursor.execute(sql)
    conn.commit()

    return {'deleted': where}

@saloon_router.put("/")
async def update_items(attrDict: dict, where: dict):
    cursor = conn.cursor()
    sql = Saloon.updateSql(where=where, attrDict=attrDict)
    cursor.execute(sql)
    conn.commit()

    return {'updated': attrDict, 'where': where}

