from fastapi import APIRouter
from conn import conn
from model.bedroom import Bedroom

bedroom_router = APIRouter(
    prefix="/bedroom",
    tags=["bedroom"],
)

@bedroom_router.get("/")
async def read_items(attr: list, where: dict):
    cursor = conn.cursor()
    sql = Bedroom.querySql(attr=attr, where=where)
    cursor.execute(sql)

    lines = cursor.fetchall()

    return {'values': lines}

@bedroom_router.post("/")
async def insert_item(bedroom: Bedroom):
    cursor = conn.cursor()
    sql = bedroom.insertSql()
    cursor.execute(sql)
    conn.commit()

    return {'added':bedroom}

@bedroom_router.delete("/")
async def delete_item(where: dict):
    cursor = conn.cursor()
    sql = Bedroom.deleteSql(where=where)
    cursor.execute(sql)
    conn.commit()

    return {'deleted': where}

@bedroom_router.put("/")
async def update_items(attrDict: dict, where: dict):
    cursor = conn.cursor()
    sql = Bedroom.updateSql(where=where, attrDict=attrDict)
    cursor.execute(sql)
    conn.commit()

    return {'updated': attrDict, 'where': where}

